import 'package:catbreedsapp/core/data/https/exception.dart';
import 'package:catbreedsapp/core/data/https/status_code.dart';
import 'package:catbreedsapp/features/cat_breeds/data/data_sources/data_sources_data_const.dart';
import 'package:catbreedsapp/features/cat_breeds/data/data_sources/remote/cat_breed_service.dart';
import 'package:catbreedsapp/features/cat_breeds/data/dto/cat_breed_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late CatBreedServiceImpl service;

  setUp(() {
    mockDio = MockDio();
    service = CatBreedServiceImpl(mockDio);
    registerFallbackValue(Uri());
  });

  group('CatBreedServiceImpl', () {
    test('should fetch cat breeds and resolve image URLs', () async {
      // Arrange
      const page = 1;
      const limit = 2;

      final mockCatBreedsResponse = [
        {
          'id': '1',
          'name': 'Breed 1',
          'reference_image_id': 'image1',
        },
        {
          'id': '2',
          'name': 'Breed 2',
          'reference_image_id': 'image2',
        },
      ];

      final mockImageResponse1 = {'url': 'https://example.com/image1.jpg'};
      final mockImageResponse2 = {'url': 'https://example.com/image2.jpg'};

      // Mock the response for fetching the list of cat breeds
      when(() => mockDio.getUri<List<dynamic>>(any())).thenAnswer(
        (_) async => Response(
          data: mockCatBreedsResponse,
          statusCode: StatusCode.ok,
          requestOptions: RequestOptions(),
        ),
      );

      // Mock the response for fetching the image URL for image1
      when(
        () => mockDio.getUri<Map<String, dynamic>>(
          Uri.https(
            CatBreedServiceDataConst.api,
            '/v1/images/image1',
          ),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: mockImageResponse1,
          statusCode: StatusCode.ok,
          requestOptions: RequestOptions(),
        ),
      );

      // Mock the response for fetching the image URL for image2
      when(
        () => mockDio.getUri<Map<String, dynamic>>(
          Uri.https(
            CatBreedServiceDataConst.api,
            '/v1/images/image2',
          ),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: mockImageResponse2,
          statusCode: StatusCode.ok,
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await service.getCatBreeds(page: page, limit: limit);

      // Assert
      expect(result.data, isA<List<CatBreedDTO>>());
      expect(result.data.length, 2);
      expect(result.data[0].imageUrl, 'https://example.com/image1.jpg');
      expect(result.data[1].imageUrl, 'https://example.com/image2.jpg');
    });

    test('should throw RestApiException when fetching cat breeds fails',
        () async {
      // Arrange
      const page = 1;
      const limit = 2;

      when(() => mockDio.getUri<List<dynamic>>(any())).thenAnswer(
        (_) async => Response(
          statusCode: StatusCode.badRequest,
          requestOptions: RequestOptions(),
        ),
      );

      // Act & Assert
      expect(
        () => service.getCatBreeds(page: page, limit: limit),
        throwsA(isA<RestApiException>()),
      );
    });

    test('should return null when fetching image URL fails', () async {
      // Arrange
      const imageId = 'image1';
      final mockCatBreedsResponse = [
        {
          'id': '1',
          'name': 'Breed 1',
          'reference_image_id': 'image1',
        }
      ];

      // Mock the response for fetching the list of cat breeds
      when(() => mockDio.getUri<List<dynamic>>(any())).thenAnswer(
        (_) async => Response(
          data: mockCatBreedsResponse,
          statusCode: StatusCode.ok,
          requestOptions: RequestOptions(),
        ),
      );

      when(
        () => mockDio.getUri<Map<String, dynamic>>(
          Uri.https(
            CatBreedServiceDataConst.api,
            '/v1/images/$imageId',
          ),
        ),
      ).thenAnswer(
        (_) async => Response(
          statusCode: StatusCode.badRequest,
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await service.getCatBreeds(page: 1, limit: 1);

      // Assert
      expect(result.data[0].imageUrl, isNull);
    });
  });
}
