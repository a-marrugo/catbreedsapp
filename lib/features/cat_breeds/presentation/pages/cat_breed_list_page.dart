import 'dart:async';

import 'package:catbreedsapp/core/presentation/pages/base_page.dart';
import 'package:catbreedsapp/core/presentation/styles/app_palette.dart';
import 'package:catbreedsapp/core/presentation/widgets/circular_progress_indicator_widget.dart';
import 'package:catbreedsapp/core/presentation/widgets/text_button_widget.dart';
import 'package:catbreedsapp/core/shared/constants/assets_image_constant.dart';
import 'package:catbreedsapp/core/shared/extensions/build_context_extension.dart';
import 'package:catbreedsapp/core/shared/l10n/l10n.dart';
import 'package:catbreedsapp/core/shared/router/router_constant.dart';
import 'package:catbreedsapp/features/cat_breeds/application/providers/providers.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/widgets/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

/// CatBreedListPage displays a scrollable list of cat breeds with a search bar.
///
/// - Fetches and displays cat breed data in a card format.
/// - Includes a search bar that animates in/out on scroll.
/// - Handles loading, error, and empty states.
/// - Uses Riverpod for state management.
class CatBreedListPage extends ConsumerStatefulWidget {
  /// Creates a CatBreedListPage.
  const CatBreedListPage({super.key});

  @override
  ConsumerState<CatBreedListPage> createState() => _CatBreedListPageState();
}

/// Private state for CatBreedListPage.
/// Handles scroll events, search debounce, and header animation.
class _CatBreedListPageState extends ConsumerState<CatBreedListPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;

  bool _showHeader = true;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    _focusNode.addListener(() => setState(() {}));
  }

  void _handleScroll() {
    final offset = _scrollController.offset;

    if (offset > lastOffset && _showHeader) {
      setState(() => _showHeader = false);
    } else if (offset < lastOffset && !_showHeader) {
      setState(() => _showHeader = true);
    }

    lastOffset = offset;
  }

  // Add this method to hide the keyboard
  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _focusNode.dispose();
    _textEditingController.dispose();
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    ref.read(catBreedsNotifierProvider.notifier).search(value);
  }

  @override
  Widget build(BuildContext context) {
    final breedsState = ref.watch(catBreedsNotifierProvider);

    ref.listen(
      catBreedsNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          error: (_, __) => _hideKeyboard(),
          orElse: () {},
        );
      },
    );

    return BasePage(
      appBarTitle: context.l10n.appName,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 6)),
            SliverToBoxAdapter(
              child: _SearchHeader(
                showHeader: _showHeader,
                focusNode: _focusNode,
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 400), () {
                    _onSearchChanged(value);
                  });
                },
                textEditingController: _textEditingController,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(height: 16, color: Colors.white),
            ),
            breedsState.maybeWhen(
              orElse: () => const SliverFillRemaining(child: SizedBox()),
              loading: () {
                return const SliverFillRemaining(child: _SearchLottie());
              },
              data: (breeds) => _CatBreedList(
                breeds: breeds,
                notifier: ref.read(catBreedsNotifierProvider.notifier),
                context: context,
              ),
              error: (error, stack) {
                _textEditingController.clear();
                return const SliverFillRemaining(
                  child: _ErrorLottie(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Animated search bar widget for filtering cat breeds.
class _SearchHeader extends StatelessWidget {
  const _SearchHeader({
    required this.showHeader,
    required this.focusNode,
    required this.onChanged,
    required this.textEditingController,
  });
  final bool showHeader;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: showHeader ? 40 : 0,
      color: Colors.white,
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: showHeader ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: context.l10n.searchCatBreeds,
              prefixIcon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: Icon(
                  Icons.search_outlined,
                  color: focusNode.hasFocus ? AppPalette.accentColor : null,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            textInputAction: TextInputAction.search,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

/// Sliver list widget for displaying cat breed cards and pagination.
class _CatBreedList extends StatelessWidget {
  const _CatBreedList({
    required this.breeds,
    required this.notifier,
    required this.context,
  });
  final List<CatBreed> breeds;
  final dynamic notifier;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index < breeds.length) {
            return CatBreedCard(
              catBreed: breeds[index],
              onTap: () {
                context.router.navigate(
                  context,
                  navigationConstant: RouteConstants.catBreedDetailPage,
                  arguments: breeds[index],
                );
              },
            );
          } else {
            if (notifier.isLastPage == true) {
              return Center(child: Text(this.context.l10n.noMoreData));
            } else {
              notifier.loadMore();
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: CircularProgressIndicatorWidget(
                    backgroundColor: AppPalette.accentColor,
                    color: Colors.white,
                  ),
                ),
              );
            }
          }
        },
        childCount: breeds.length + 1,
      ),
    );
  }
}

/// Widget to display an error animation when loading fails.
class _ErrorLottie extends ConsumerWidget {
  const _ErrorLottie();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            AssetsLottieConstant.notFound,
            width: double.infinity,
            repeat: true,
            animate: true,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: TextButtonWidget(
              text: context.l10n.retry,
              onPressed: () {
                Future.microtask(
                  () => ref.read(catBreedsNotifierProvider.notifier).build(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget to display an error animation when loading fails.
class _SearchLottie extends StatelessWidget {
  const _SearchLottie();

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AssetsLottieConstant.search,
      width: double.infinity,
      repeat: true,
      animate: true,
    );
  }
}
