import 'package:catbreedsapp/core/data/dto/base_data_dto.dart';
import 'package:catbreedsapp/features/cat_breeds/data/data_sources/remote/cat_breed_service.dart';
import 'package:catbreedsapp/features/cat_breeds/data/dto/cat_breed_dto.dart';
import 'package:catbreedsapp/features/cat_breeds/data/repositories/cat_breed_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for CatBreedService
class MockCatBreedService extends Mock implements CatBreedService {}

void main() {
  late MockCatBreedService mockCatBreedService;
  late CatBreedRepositoryImpl repository;

  setUp(() {
    mockCatBreedService = MockCatBreedService();
    repository = CatBreedRepositoryImpl(mockCatBreedService);
  });

  group('CatBreedRepositoryImpl', () {
    test('should fetch cat breeds and map them to domain entities', () async {
      // Arrange
      final catBreedsDTO = [
        const CatBreedDTO(
          id: '1',
          name: 'Persian',
          imageUrl: 'image_url_1',
          temperament: 'Gentle',
          origin: 'Iran',
          description: 'A long-haired breed.',
          lifeSpan: '12 - 17',
          wikipediaUrl: 'https://en.wikipedia.org/wiki/Persian_(cat)',
        ),
        const CatBreedDTO(
          id: '2',
          name: 'Siamese',
          imageUrl: 'image_url_2',
          temperament: 'Playful',
          origin: 'Thailand',
          description: 'A short-haired breed.',
          lifeSpan: '10 - 15',
          wikipediaUrl: 'https://en.wikipedia.org/wiki/Siamese_(cat)',
        ),
      ];
      final baseDataDTO = BaseDataDTO(data: catBreedsDTO);

      when(() => mockCatBreedService.getCatBreeds(page: 1, limit: 10))
          .thenAnswer((_) async => baseDataDTO);

      // Act
      final result = await repository.getCatBreeds(page: 1, limit: 10);

      // Assert
      expect(result.data.length, catBreedsDTO.length);
      expect(result.data[0].id, catBreedsDTO[0].id);
      expect(result.data[0].name, catBreedsDTO[0].name);
      expect(result.data[1].id, catBreedsDTO[1].id);
      expect(result.data[1].name, catBreedsDTO[1].name);
      verify(() => mockCatBreedService.getCatBreeds(page: 1, limit: 10))
          .called(1);
      verifyNoMoreInteractions(mockCatBreedService);
    });

    test('should throw an exception when the service fails', () async {
      // Arrange
      final exception = Exception('Failed to fetch cat breeds');
      when(() => mockCatBreedService.getCatBreeds(page: 1, limit: 10))
          .thenThrow(exception);

      // Act
      final call = repository.getCatBreeds;

      // Assert
      expect(() => call(page: 1, limit: 10), throwsA(exception));
      verify(() => mockCatBreedService.getCatBreeds(page: 1, limit: 10))
          .called(1);
      verifyNoMoreInteractions(mockCatBreedService);
    });
  });
}
