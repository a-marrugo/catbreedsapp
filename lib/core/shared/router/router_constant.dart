/// Defines the route constants used in the application.
///
/// This enum provides a structured way to manage named routes by associating
/// each route with its respective path.
enum RouteConstants {
  /// The home  screen of the app.
  catBreedListPage(path: '/cat_breed_list_page'),

  /// The social  screen of the app.
  socialPage(path: '/social_page'),

  /// The detail  screen of the cat breed.
  catBreedDetailPage(path: '/cat_breed_detail');

  /// Constructor for defining a route with its corresponding path.
  const RouteConstants({required this.path});

  /// The path associated with the route.
  final String path;
}
