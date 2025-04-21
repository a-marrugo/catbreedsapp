import 'package:catbreedsapp/core/di/di.config.dart';
import 'package:catbreedsapp/core/shared/dio/dio_client.dart';
import 'package:catbreedsapp/core/shared/router/router_app.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Access to the Singleton instance of GetIt
final GetIt getIt = GetIt.instance;

/// Initializes dependency injection using Injectable and GetIt.
@InjectableInit()
void configureDependencies() => getIt.init();

/// Module for inject external dependencies
@module
abstract class InjectableModule {
  /// Injection for [RouterApp]
  @lazySingleton
  RouterApp get router => RouterApp();

  /// Injection for [Dio] Logger
  @lazySingleton
  Dio get dioClient => DioClient.getInstance();
}
