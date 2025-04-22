import 'package:catbreedsapp/core/presentation/pages/base_page.dart';
import 'package:catbreedsapp/core/presentation/styles/app_palette.dart';
import 'package:catbreedsapp/core/presentation/widgets/circular_progress_indicator_widget.dart';
import 'package:catbreedsapp/core/shared/l10n/l10n.dart';
import 'package:catbreedsapp/features/cat_breeds/application/providers/providers.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/widgets/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This page is responsible for displaying a list of cat breeds.
/// It will fetch data and display it in a scrollable list of cards.
/// Each card will show basic information about a specific cat breed.
class CatBreedListPage extends ConsumerStatefulWidget {
  /// Constructor
  const CatBreedListPage({super.key});

  @override
  ConsumerState<CatBreedListPage> createState() => _CatBreedListPageState();
}

class _CatBreedListPageState extends ConsumerState<CatBreedListPage> {
  final ScrollController _scrollController = ScrollController();

  bool _showHeader = true;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final offset = _scrollController.offset;

    if (offset > lastOffset && _showHeader) {
      setState(() {
        _showHeader = false;
      });
    } else if (offset < lastOffset && !_showHeader) {
      setState(() {
        _showHeader = true;
      });
    }

    lastOffset = offset;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final breedsState = ref.watch(catBreedsNotifierProvider);
    final isLoadingData = breedsState.maybeWhen(
      orElse: () => false,
      loading: () => true,
    );

    return BasePage(
      appBarTitle: context.l10n.appName,
      backgroundColor: Colors.white,
      isLoading: isLoadingData,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: _showHeader ? 40 : 0,
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: _showHeader ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Placeholder(),
                ),
              ),
              const SizedBox(height: 26),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior()
                      .copyWith(physics: const ClampingScrollPhysics()),
                  child: breedsState.maybeWhen(
                    orElse: SizedBox.new,
                    data: (breeds) {
                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: breeds.length +
                            1, // Add 1 for the loading indicator
                        itemBuilder: (context, index) {
                          if (index < breeds.length) {
                            return CatBreedCard(catBreed: breeds[index]);
                          } else {
                            // Show a loading indicator or a "No more data" message
                            final notifier =
                                ref.read(catBreedsNotifierProvider.notifier);
                            if (notifier.isLastPage) {
                              return const Center(child: Text('No more data'));
                            } else {
                              notifier.loadMore(); // Trigger loading more data
                              return const Center(
                                child: CircularProgressIndicatorWidget(
                                  strokeWidth: 8,
                                  backgroundColor: AppPalette.accentColor,
                                  color: Colors.white,
                                ),
                              );
                            }
                          }
                        },
                      );
                    },
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
