import 'package:catbreedsapp/core/di/di.dart';
import 'package:catbreedsapp/features/cat_breeds/application/notifiers/cat_breed_notifier.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/use_cases/get_cat_breeds_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Riverpod provider that manages the state of cat breeds
/// data using `CatBreedsNotifier`.
final catBreedsNotifierProvider =
    AsyncNotifierProvider<CatBreedsNotifier, List<CatBreed>>(
  () => CatBreedsNotifier(getIt<GetUserUseCase>()),
);
