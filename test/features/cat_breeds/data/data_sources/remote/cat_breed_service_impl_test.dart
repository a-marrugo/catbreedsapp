import 'package:catbreedsapp/core/data/https/exception.dart';
import 'package:catbreedsapp/features/cat_breeds/data/data_sources/remote/cat_breed_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for Dio
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
    test('should fetch cat breeds successfully', () async {
      // Arrange
      final responseData = [
        {
          'id': '1',
          'name': 'Persian',
          'reference_image_id': 'image_url_1',
          'temperament': 'Gentle',
          'origin': 'Iran',
          'description': 'A long-haired breed.',
          'life_span': '12 - 17',
          'wikipedia_url': 'https://en.wikipedia.org/wiki/Persian_(cat)',
        },
        {
          'id': '2',
          'name': 'Siamese',
          'reference_image_id': 'image_url_2',
          'temperament': 'Playful',
          'origin': 'Thailand',
          'description': 'A short-haired breed.',
          'life_span': '10 - 15',
          'wikipedia_url': 'https://en.wikipedia.org/wiki/Siamese_(cat)',
        },
      ];

      final response = Response<List<dynamic>>(
        data: responseData,
        statusCode: 200,
        requestOptions: RequestOptions(),
      );

      when(() => mockDio.getUri<List<dynamic>>(any()))
          .thenAnswer((_) async => response);

      // Act
      final result = await service.getCatBreeds(page: 1, limit: 10);

      // Assert
      expect(result.data.length, responseData.length);
      expect(result.data[0].id, responseData[0]['id']);
      expect(result.data[0].name, responseData[0]['name']);
      verify(() => mockDio.getUri<List<dynamic>>(any())).called(1);
    });

    test('should throw RestApiException when status code is not 200', () async {
      // Arrange
      final response = Response<List<dynamic>>(
        data: null,
        statusCode: 404,
        requestOptions: RequestOptions(),
        statusMessage: 'Not Found',
      );

      when(() => mockDio.getUri<List<dynamic>>(any()))
          .thenAnswer((_) async => response);

      // Act
      final call = service.getCatBreeds;

      // Assert
      expect(
        () => call(page: 1, limit: 10),
        throwsA(isA<RestApiException>()),
      );
      verify(() => mockDio.getUri<List<dynamic>>(any())).called(1);
    });

    test('should throw DioException on Dio error', () async {
      // Arrange
      when(() => mockDio.getUri<List<dynamic>>(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      // Act
      final call = service.getCatBreeds;

      // Assert
      expect(
        () => call(page: 1, limit: 10),
        throwsA(isA<RestApiException>()),
      );
      verify(() => mockDio.getUri<List<dynamic>>(any())).called(1);
    });
  });
}
