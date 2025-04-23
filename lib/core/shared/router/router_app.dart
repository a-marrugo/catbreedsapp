// ignore_for_file: cast_nullable_to_non_nullable

import 'package:catbreedsapp/core/shared/router/router_constant.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/pages/cat_breed_detail_page.dart';
import 'package:catbreedsapp/features/cat_breeds/presentation/pages/cat_breed_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Manages the application's routing configuration using `GoRouter`.
///
/// The `RouterApp` class defines the application's navigation structure,
/// specifying the initial route and the available routes within the app.
class RouterApp {
  /// Router configuration
  final goRouter = GoRouter(
    initialLocation: RouteConstants.catBreedListPage.path,
    routes: [
      GoRoute(
        path: RouteConstants.catBreedListPage.path,
        name: RouteConstants.catBreedListPage.path,
        builder: (context, state) => const CatBreedListPage(),
      ),
      GoRoute(
        path: RouteConstants.catBreedDetailPage.path,
        name: RouteConstants.catBreedDetailPage.path,
        pageBuilder: (context, state) {
          final catBreed = state.extra as CatBreed;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CatBreedDetailPage(catBreed: catBreed),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
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
    Object? arguments,
  }) async {
    await context.push(
      navigationConstant.path,
      extra: arguments,
    );
  }
}
