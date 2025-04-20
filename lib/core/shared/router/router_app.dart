import 'package:catbreedsapp/core/presentation/pages/base_page.dart';
import 'package:catbreedsapp/core/shared/router/router_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Manages the application's routing configuration using `GoRouter`.
///
/// The `RouterApp` class defines the application's navigation structure,
/// specifying the initial route and the available routes within the app.
class RouterApp {
  /// Router configuration
  final goRouter = GoRouter(
    initialLocation: RouteConstants.splashPage.path,
    routes: [
      GoRoute(
        path: RouteConstants.splashPage.path,
        builder: (context, state) => const BasePage(child: SizedBox()),
      ),
      GoRoute(
        path: RouteConstants.signUpPage.path,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const BasePage(child: SizedBox()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    ],
  );

  /// Navigates to a new route, replacing the current one in the navigation stack.
  ///
  /// This function asynchronously pushes a new route using the provided [RouteConstants]
  /// and replaces the existing route in the stack.
  Future<void> navigate(
    BuildContext context, {
    required RouteConstants navigationConstant,
    bool push = false,
  }) async {
    if (push) {
      await Future.microtask(
        () => context.pushReplacement(navigationConstant.path),
      );
    } else {
      await Future.microtask(
        () => context.push(navigationConstant.path),
      );
    }
  }
}
