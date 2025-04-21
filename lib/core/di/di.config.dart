// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:catbreedsapp/core/di/di.dart' as _i928;
import 'package:catbreedsapp/core/shared/router/router_app.dart' as _i459;
import 'package:catbreedsapp/features/cat_breeds/data/data_sources/remote/cat_breed_service.dart'
    as _i413;
import 'package:catbreedsapp/features/cat_breeds/data/repositories/cat_breed_repository_impl.dart'
    as _i1010;
import 'package:catbreedsapp/features/cat_breeds/domain/repositories/cat_breed_repository.dart'
    as _i31;
import 'package:catbreedsapp/features/cat_breeds/domain/use_cases/get_cat_breeds_use_case.dart'
    as _i192;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i459.RouterApp>(() => injectableModule.router);
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dioClient);
    gh.factory<_i413.CatBreedService>(
        () => _i413.CatBreedServiceImpl(gh<_i361.Dio>()));
    gh.factory<_i31.CatBreedRepository>(
        () => _i1010.CatBreedRepositoryImpl(gh<_i413.CatBreedService>()));
    gh.factory<_i192.GetUserUseCase>(
        () => _i192.GetUserUseCase(gh<_i31.CatBreedRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i928.InjectableModule {}
