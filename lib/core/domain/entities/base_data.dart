import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_data.freezed.dart';

/// Base class to handle base URL for image and data
@freezed
class BaseData<T> with _$BaseData<T> {
  /// Constructor
  const factory BaseData({
    /// Dynamic data parsed from some service
    required T data,
  }) = _BaseData;

  /// Empty constructor
  const BaseData._();
}
