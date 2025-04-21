import 'package:catbreedsapp/core/domain/entities/base_data.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/repositories/cat_breed_repository.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/use_cases/get_cat_breeds_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for CatBreedRepository
class MockCatBreedRepository extends Mock implements CatBreedRepository {}

void main() {
  late MockCatBreedRepository mockCatBreedRepository;
  late GetUserUseCase getCatBreedsUseCase;

  setUp(() {
    mockCatBreedRepository = MockCatBreedRepository();
    getCatBreedsUseCase = GetUserUseCase(mockCatBreedRepository);
  });

  group('GetUserUseCase', () {
    test('should retrieve a list of cat breeds from the repository', () async {
      // Arrange
      final catBreeds = [
        const CatBreed(id: '1', name: 'Persian', imageUrl: 'image url'),
        const CatBreed(id: '2', name: 'Siamese', imageUrl: 'image url'),
      ];
      final baseData = BaseData<List<CatBreed>>(data: catBreeds);

      when(
        () => mockCatBreedRepository.getCatBreeds(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => baseData);

      // Act
      final params = ParamsGetUserUseCase(page: 1, limit: 10);
      final result = await getCatBreedsUseCase.execute(params);

      // Assert
      expect(result, baseData);
      verify(
        () => mockCatBreedRepository.getCatBreeds(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockCatBreedRepository);
    });

    test('should throw an exception when the repository fails', () async {
      // Arrange
      final exception = Exception('Failed to fetch cat breeds');
      when(
        () => mockCatBreedRepository.getCatBreeds(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenThrow(exception);

      // Act
      final call = getCatBreedsUseCase.execute;

      // Assert
      final params = ParamsGetUserUseCase(page: 1, limit: 10);
      expect(() => call(params), throwsA(exception));
      verify(
        () => mockCatBreedRepository.getCatBreeds(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockCatBreedRepository);
    });
  });
}
