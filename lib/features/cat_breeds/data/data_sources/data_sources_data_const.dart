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

  /// This constant represents the endpoint for retrieving
  /// the list of cat breeds.
  ///
  /// - Value: `/v1/breeds`
  static String get getCatBreedEndPoint => '/v1/breeds';
}
