import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_breed_dto.freezed.dart';
part 'cat_breed_dto.g.dart';

/// Data Transfer Object for handling cat breed
/// information from a remote service.
@freezed
class CatBreedDTO with _$CatBreedDTO {
  /// Named constructor
  const factory CatBreedDTO({
    /// Unique identifier for the cat breed
    @JsonKey(name: 'id') required String id,

    /// Name of the cat breed
    @JsonKey(name: 'name') required String name,

    /// URL of the image representing the cat breed
    @JsonKey(name: 'reference_image_id') String? imageUrl,

    /// Description of the cat breed's temperament (optional)
    @JsonKey(name: 'temperament') String? temperament,

    /// Country or region of origin (optional)
    @JsonKey(name: 'origin') String? origin,

    /// Detailed description of the cat breed (optional)
    @JsonKey(name: 'description') String? description,

    /// Average lifespan of the cat breed (optional)
    @JsonKey(name: 'life_span') String? lifeSpan,

    /// URL to the Wikipedia page for the cat breed (optional)
    @JsonKey(name: 'wikipedia_url') String? wikipediaUrl,
  }) = _CatBreedDTO;

  /// Factory constructor for creating a `CatBreedDTO` from JSON
  factory CatBreedDTO.fromJson(Map<String, dynamic> json) =>
      _$CatBreedDTOFromJson(json);
}
