import 'dart:ui';
import 'package:catbreedsapp/core/presentation/styles/app_palette.dart';
import 'package:catbreedsapp/core/presentation/widgets/circular_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

/// A base page widget that provides a consistent layout structure
/// including an optional AppBar, bottom navigation bar, and background color.
class BasePage extends StatelessWidget {
  /// Creates a [BasePage] instance.
  const BasePage({
    required this.child,
    super.key,
    this.appBarTitle,
    this.appBarActions,
    this.leading,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.isLoading = false,
    this.loadingText,
    this.floatingActionButton,
  });

  /// The main content widget of the page.
  final Widget child;

  /// The title displayed in the AppBar.
  final String? appBarTitle;

  /// The list of action widgets displayed in the AppBar.
  final List<Widget>? appBarActions;

  /// The leading widget displayed in the AppBar.
  final Widget? leading;

  /// The bottom navigation bar widget.
  final Widget? bottomNavigationBar;

  /// The background color of the page.
  final Color? backgroundColor;

  /// Determines if a loading overlay should be displayed.
  final bool isLoading;

  /// Text to display when in a loading state.
  final String? loadingText;

  /// A button displayed floating above body, in the bottom right corner.
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: backgroundColor ?? AppPalette.bgColor,
          appBar: (appBarTitle != null || leading != null)
              ? AppBar(
                  title: Text(
                    appBarTitle ?? '',
                    style: const TextStyle(color: Colors.black),
                  ),
                  actions: appBarActions,
                  leading: leading,
                  backgroundColor: Colors.white,
                  elevation: 0,
                )
              : null,
          body: child,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
        ),
        if (isLoading) _buildLoadingOverlay(),
      ],
    );
  }

  Widget _buildLoadingOverlay() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          key: const Key('loaderContainer'),
          color: const Color(0xFF0D1A26).withOpacity(0.6),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicatorWidget(
                strokeWidth: 8,
                backgroundColor: AppPalette.accentColor,
                color: Colors.white,
              ),
              if (loadingText != null) ...[
                const SizedBox(height: 16),
                Text(
                  loadingText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
