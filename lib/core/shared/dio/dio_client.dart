import 'package:catbreedsapp/core/shared/dio/dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// This is the general Dio client to which we can add a custom base
// /url and custom interceptors.
///
/// The static method getInstance is used to retrieve an instance
/// asynchronously for this class.
class DioClient {
  /// Constructor
  DioClient();

  /// The getInstance method is used by GetIt to retrieve an
  /// asynchronous instance.
  /// The [contentType] is the content element to set on the client. Check dio/src/headers.dart for more info.
  /// The [interceptors] is the array of interceptors to add to this client.
  static Dio getInstance({
    String contentType = Headers.jsonContentType,
    List<Interceptor>? interceptors,
  }) {
    final dioClient = DioClient();
    return dioClient._createInstance(
      contentType,
      interceptors,
    );
  }

  /// Method that creates the instance and adds the interceptors
  Dio _createInstance(
    String contentType,
    List<Interceptor>? interceptors,
  ) {
    final dio = Dio()..options = _configureDio(contentType);
    _addInterceptors(dio, interceptors);
    return dio;
  }

  BaseOptions _configureDio(String contentType) => BaseOptions(
        contentType: contentType,
      );

  /// Add the interceptors passed by parameters to the client and if
  /// is in debug mode add the logInterceptor
  void _addInterceptors(
    Dio dio,
    List<Interceptor>? interceptors,
  ) {
    if (kDebugMode) dio.interceptors.addAll([_logInterceptor()]);
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// Create an instance of a custom interceptor
  static DioLogger _logInterceptor() => DioLogger(
        requestHeader: true,
        requestBody: true,
      );
}
