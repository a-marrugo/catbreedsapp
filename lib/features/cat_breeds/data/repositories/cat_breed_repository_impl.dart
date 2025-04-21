import 'package:catbreedsapp/core/domain/entities/base_data.dart';
import 'package:catbreedsapp/features/cat_breeds/data/data_sources/remote/cat_breed_service.dart';
import 'package:catbreedsapp/features/cat_breeds/data/mapper/mapper_domain.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/repositories/cat_breed_repository.dart';
import 'package:injectable/injectable.dart';

/// Implementation of [CatBreedRepository]
@Injectable(as: CatBreedRepository)
class CatBreedRepositoryImpl extends CatBreedRepository {
  /// Constructor
  CatBreedRepositoryImpl(this._catBreedService);

  final CatBreedService _catBreedService;

  @override
  Future<BaseData<List<CatBreed>>> getCatBreeds({
    required int page,
    int? limit,
  }) async {
    final response =
        await _catBreedService.getCatBreeds(page: page, limit: limit);
    return BaseData(data: response.data.toDomain);
  }
}
