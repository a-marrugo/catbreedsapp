/// Constant values for `CatBreedService`
class CatBreedServiceDataConst {
  /// TODO:
  /// For the simplicity of the test, I’m adding this here,
  /// but ideally I would create an AppConfig for environments
  /// to be able to run the project in different environments:
  /// QA, dev, and prod.
  ///
  /// This constant represents the base URL for the Cat API.
  static String get api => 'api.thecatapi.com';

  /// Builds the relative endpoint path to fetch the URL of a specific image.
  static String getImageUrl(String imageId) => '/v1/images/$imageId';

  /// This constant represents the endpoint for retrieving
  /// the list of cat breeds.
  ///
  /// - Value: `/v1/breeds`
  static String getCatBreedEndPoint(String? query) =>
      query != null ? '/v1/breeds/search' : '/v1/breeds';
}
