import 'dart:io';

import 'package:catbreedsapp/core/data/https/exception.dart';
import 'package:dio/dio.dart';

/// Extension on `DioException` to provide additional utility methods.
///
/// This extension adds a method to check if the exception was caused
/// by a lack of internet connection.
extension DioError on DioException {
  /// Check if there is internet connection
  bool get isNoConnectionError {
    return type == DioExceptionType.unknown && error is SocketException;
  }
}

/// Class with reusable methods to use in the data source layer
class BaseDataSource<T> {
  /// Generic method that handles common exceptions when making a request
  /// even server [T] type of data to return in the request
  /// [execute] the function that will perform the request
  Future<T> serverRequest<T>(Future<T> Function() execute) async {
    try {
      return await execute();
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        throw const NoInternetConnectionException();
      }

      final error = e.response?.data;
      final message =
          (error is Map<String, dynamic> && error['message'] != null)
              ? error['message'] as String
              : e.response?.statusMessage;

      throw RestApiException(
        errorCode: e.response?.statusCode,
        errorMessage: message,
      );
    } catch (e) {
      throw RestApiException(errorMessage: e.toString());
    }
  }
}
