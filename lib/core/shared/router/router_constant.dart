/// Defines the route constants used in the application.
///
/// This enum provides a structured way to manage named routes by associating
/// each route with its respective path.
enum RouteConstants {
  /// The initial splash screen of the app.
  splashPage(path: '/'),

  /// The home  screen of the app.
  homePage(path: '/home'),

  /// The sign-up page for new users.
  signUpPage(path: '/sign_up');

  /// Constructor for defining a route with its corresponding path.
  const RouteConstants({required this.path});

  /// The path associated with the route.
  final String path;
}
