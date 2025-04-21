import 'package:catbreedsapp/core/data/dto/base_data_dto.dart';
import 'package:catbreedsapp/core/domain/entities/base_data.dart';
import 'package:catbreedsapp/features/cat_breeds/data/dto/cat_breed_dto.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';

/// Extension for [BaseDataDTO<List<CatBreedDTO>>]
extension MapperBaseDataDTOListCatBreedDTO on BaseDataDTO<List<CatBreedDTO>> {
  /// Convert [BaseDataDTO<List<CatBreedDTO>>] to [BaseData<List<CatBreed>>]
  BaseData<List<CatBreed>> get toDomain => BaseData<List<CatBreed>>(
        data: data.toDomain,
      );
}

/// Extension for [List<CatBreedDTO>]
extension MapperListCatBreedDTO on List<CatBreedDTO> {
  /// Convert [List<CatBreedDTO>] to [List<CatBreed>]
  List<CatBreed> get toDomain => map((CatBreedDTO e) => e.toDomain).toList();
}

/// Extension for [CatBreedDTO]
extension MapperCatBreedDTO on CatBreedDTO {
  /// Convert [CatBreedDTO] to [CatBreed]
  CatBreed get toDomain => CatBreed(
        id: id,
        name: name,
        imageUrl: imageUrl,
        description: description,
        lifeSpan: lifeSpan,
        origin: origin,
        temperament: temperament,
        wikipediaUrl: wikipediaUrl,
      );
}
