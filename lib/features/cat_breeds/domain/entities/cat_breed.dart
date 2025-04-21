import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_breed.freezed.dart';

/// Represents information about a cat breed.
///
/// Parameters:
/// - `id`: Unique identifier for the cat breed.
/// - `name`: Name of the cat breed.
/// - `imageUrl`: URL of the image representing the cat breed.
/// - `temperament`: (Optional) Description of the cat breed's temperament.
/// - `origin`: (Optional) Country or region of origin.
/// - `description`: (Optional) Detailed description of the cat breed.
/// - `lifeSpan`: (Optional) Average lifespan of the cat breed.
/// - `wikipediaUrl`: (Optional) URL to the Wikipedia page for the cat breed.
@freezed
class CatBreed with _$CatBreed {
  /// Creates a [CatBreed] instance
  const factory CatBreed({
    required String id,
    required String name,
    String? imageUrl,
    String? temperament,
    String? origin,
    String? description,
    String? lifeSpan,
    String? wikipediaUrl,
  }) = _CatBreed;

  const CatBreed._();
}
