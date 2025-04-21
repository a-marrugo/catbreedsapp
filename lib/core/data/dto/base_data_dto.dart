import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_data_dto.freezed.dart';

/// Handle basic information when service handle image URL data
@Freezed(genericArgumentFactories: true)
class BaseDataDTO<T> with _$BaseDataDTO<T> {
  /// Named constructor
  const factory BaseDataDTO({
    /// Data dynamic from service
    @JsonKey(name: 'data') required T data,
  }) = _BaseDataDTO;
}
