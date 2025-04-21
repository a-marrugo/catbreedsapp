import 'package:catbreedsapp/core/domain/entities/base_data.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';

/// This abstract class defines the contract for retrieving cat
/// breed data from a remote data source.
///
/// Responsibilities:
/// - Fetches a list of cat breeds from a remote API or data source.
// ignore: one_member_abstracts
abstract class CatBreedRepository {
  /// - `getCatBreeds`: Returns a `Future` containing
  /// `BaseData<List<CatBreed>>`, which holds the list of cat breeds
  /// retrieved from the remote source.
  Future<BaseData<List<CatBreed>>> getCatBreeds({
    required int page,
    int? limit,
  });
}
