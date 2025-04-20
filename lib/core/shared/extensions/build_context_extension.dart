import 'package:catbreedsapp/core/di/di.dart';
import 'package:catbreedsapp/core/shared/router/router_app.dart';
import 'package:flutter/material.dart';

/// Extension to perform actions on [BuildContext]
extension BuildContextExtension on BuildContext {
  /// Get the [MediaQueryData] from the [BuildContext]
  MediaQueryData get screenMedia => MediaQuery.of(this);

  /// Get the [Size] from the [BuildContext]
  Size get screenSize => MediaQuery.of(this).size;

  /// Get the [TextScaler]from the [BuildContext]
  TextScaler get screenTextScaler => MediaQuery.of(this).textScaler;

  /// Get the [EdgeInsets] of the screen from the [BuildContext]
  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  /// Get the [RouterApp] from the [BuildContext]
  RouterApp get router => getIt<RouterApp>();
}
