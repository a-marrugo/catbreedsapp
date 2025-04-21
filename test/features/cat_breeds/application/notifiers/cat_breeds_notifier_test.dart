import 'package:catbreedsapp/core/domain/entities/base_data.dart';
import 'package:catbreedsapp/features/cat_breeds/application/notifiers/cat_breed_notifier.dart';
import 'package:catbreedsapp/features/cat_breeds/application/providers/providers.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/use_cases/get_cat_breeds_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for GetUserUseCase
class MockGetUserUseCase extends Mock implements GetUserUseCase {}

void main() {
  late MockGetUserUseCase mockGetUserUseCase;
  late ProviderContainer container;

  setUp(() {
    mockGetUserUseCase = MockGetUserUseCase();
    container = ProviderContainer(
      overrides: [
        catBreedsNotifierProvider.overrideWith(
          () => CatBreedsNotifier(mockGetUserUseCase),
        ),
      ],
    );
    addTearDown(container.dispose);
    registerFallbackValue(ParamsGetUserUseCase(page: 1, limit: 10));
  });

  group('CatBreedsNotifier', () {
    test('should fetch initial list of cat breeds', () async {
      // Arrange
      final catBreeds = [
        const CatBreed(id: '1', name: 'Persian', imageUrl: 'image_url_1'),
        const CatBreed(id: '2', name: 'Siamese', imageUrl: 'image_url_2'),
      ];
      when(() => mockGetUserUseCase.execute(any()))
          .thenAnswer((_) async => BaseData(data: catBreeds));

      // Act
      final state = await container.read(catBreedsNotifierProvider.future);

      // Assert
      final ids = state.map((e) => e.id).toList();
      expect(ids, ['1', '2']);
      verify(() => mockGetUserUseCase.execute(any())).called(1);
    });

    test('should load more cat breeds for pagination', () async {
      // Arrange
      final initialBreeds = [
        const CatBreed(id: '1', name: 'Persian', imageUrl: 'image_url_1'),
      ];
      final moreBreeds = [
        const CatBreed(id: '2', name: 'Siamese', imageUrl: 'image_url_2'),
      ];
      when(() => mockGetUserUseCase.execute(any()))
          .thenAnswer((invocation) async {
        final params =
            invocation.positionalArguments.first as ParamsGetUserUseCase;
        if (params.page == 0) {
          return BaseData(data: initialBreeds);
        } else {
          return BaseData(data: moreBreeds);
        }
      });

      // Act
      final notifier = container.read(catBreedsNotifierProvider.notifier);
      await notifier.loadMore();

      // Assert
      final state = container.read(catBreedsNotifierProvider);
      final ids =
          (state as AsyncData<List<CatBreed>>).value.map((e) => e.id).toList();
      expect(ids, ['1', '2']);
      verify(() => mockGetUserUseCase.execute(any())).called(2);
    });
  });
}
