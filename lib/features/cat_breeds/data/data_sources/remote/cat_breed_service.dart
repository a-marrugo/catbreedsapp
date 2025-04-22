import 'package:catbreedsapp/core/data/data_sources/base_data_source.dart';
import 'package:catbreedsapp/core/data/dto/base_data_dto.dart';
import 'package:catbreedsapp/core/data/https/exception.dart';
import 'package:catbreedsapp/core/data/https/status_code.dart';
import 'package:catbreedsapp/features/cat_breeds/data/data_sources/data_sources_data_const.dart';
import 'package:catbreedsapp/features/cat_breeds/data/dto/cat_breed_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// This abstract class defines the contract for interacting with the
/// remote data source to retrieve cat breed information.
// ignore: one_member_abstracts
abstract class CatBreedService {
  /// Retrieves a `Future` containing `BaseDataDTO<List<CatBreedDTO>>`,
  /// which holds the list of cat breeds fetched from the remote data source.
  Future<BaseDataDTO<List<CatBreedDTO>>> getCatBreeds({
    required int page,
    int? limit,
  });
}

@Injectable(as: CatBreedService)

/// `CatBreedServiceImpl` implements `CatBreedService`
class CatBreedServiceImpl implements CatBreedService {
  /// Constructor
  const CatBreedServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<BaseDataDTO<List<CatBreedDTO>>> getCatBreeds({
    required int page,
    int? limit,
  }) async {
    return BaseDataSource<BaseDataDTO<List<CatBreedDTO>>>()
        .serverRequest(() async {
      final requestUri = Uri.https(
        CatBreedServiceDataConst.api,
        CatBreedServiceDataConst.getCatBreedEndPoint,
        {
          'page': page.toString(),
          'limit': (limit ?? 10).toString(),
        },
      );

      final response = await _dio.getUri<List<dynamic>>(requestUri);

      if (response.statusCode == StatusCode.ok) {
        final catBreedsDTO = response.data
                ?.map((e) => CatBreedDTO.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

        final updatedCatBreedsDTO = await Future.wait(
          catBreedsDTO.map((catBreed) async {
            if (catBreed.imageUrl != null) {
              final imageUrl = await _fetchImageUrl(catBreed.imageUrl!);
              return catBreed.copyWith(imageUrl: imageUrl);
            }
            return catBreed;
          }).toList(),
        );

        return BaseDataDTO<List<CatBreedDTO>>(data: updatedCatBreedsDTO);
      }

      // Throws Exception when status code is not 200
      throw RestApiException(
        errorCode: response.statusCode,
        errorMessage: response.statusMessage,
      );
    });
  }

  /// Private method to get the image URL
  Future<String?> _fetchImageUrl(String imageId) async {
    final requestUri = Uri.https(
      CatBreedServiceDataConst.api,
      CatBreedServiceDataConst.getImageUrl(imageId),
    );

    final response = await _dio.getUri<Map<String, dynamic>>(requestUri);

    if (response.statusCode == StatusCode.ok) {
      return response.data?['url'] as String?;
    }

    return null;
  }
}
