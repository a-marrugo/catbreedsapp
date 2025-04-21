/// Exceptions caused by unexpected and unhandled errors in request
///
/// Errors no related to Dio responses
class AppException implements Exception {
  /// Constructor
  const AppException(this.message);

  /// - `message`: A descriptive message explaining the cause of the exception.
  final String message;
}

/// Exception when there is not internet connection
class NoInternetConnectionException extends AppException {
  /// Constructor
  const NoInternetConnectionException() : super('');
}

/// Exceptions caused when there is not data found
class DataNotFoundException extends AppException {
  /// Constructor
  const DataNotFoundException(super.message);
}

/// Exceptions caused when calling API
class RestApiException extends AppException {
  /// Constructor
  RestApiException({this.errorCode, this.errorMessage})
      : super(errorMessage ?? '');

  /// - `errorCode`: code the cause of the exception.
  final int? errorCode;

  /// - `message`: A descriptive message explaining the cause of the exception.
  final String? errorMessage;
}
