// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseDataDTO<T> {
  /// Data dynamic from service
  @JsonKey(name: 'data')
  T get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseDataDTOCopyWith<T, BaseDataDTO<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseDataDTOCopyWith<T, $Res> {
  factory $BaseDataDTOCopyWith(
          BaseDataDTO<T> value, $Res Function(BaseDataDTO<T>) then) =
      _$BaseDataDTOCopyWithImpl<T, $Res, BaseDataDTO<T>>;
  @useResult
  $Res call({@JsonKey(name: 'data') T data});
}

/// @nodoc
class _$BaseDataDTOCopyWithImpl<T, $Res, $Val extends BaseDataDTO<T>>
    implements $BaseDataDTOCopyWith<T, $Res> {
  _$BaseDataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseDataDTOImplCopyWith<T, $Res>
    implements $BaseDataDTOCopyWith<T, $Res> {
  factory _$$BaseDataDTOImplCopyWith(_$BaseDataDTOImpl<T> value,
          $Res Function(_$BaseDataDTOImpl<T>) then) =
      __$$BaseDataDTOImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') T data});
}

/// @nodoc
class __$$BaseDataDTOImplCopyWithImpl<T, $Res>
    extends _$BaseDataDTOCopyWithImpl<T, $Res, _$BaseDataDTOImpl<T>>
    implements _$$BaseDataDTOImplCopyWith<T, $Res> {
  __$$BaseDataDTOImplCopyWithImpl(
      _$BaseDataDTOImpl<T> _value, $Res Function(_$BaseDataDTOImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseDataDTOImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$BaseDataDTOImpl<T> implements _BaseDataDTO<T> {
  const _$BaseDataDTOImpl({@JsonKey(name: 'data') required this.data});

  /// Data dynamic from service
  @override
  @JsonKey(name: 'data')
  final T data;

  @override
  String toString() {
    return 'BaseDataDTO<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseDataDTOImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseDataDTOImplCopyWith<T, _$BaseDataDTOImpl<T>> get copyWith =>
      __$$BaseDataDTOImplCopyWithImpl<T, _$BaseDataDTOImpl<T>>(
          this, _$identity);
}

abstract class _BaseDataDTO<T> implements BaseDataDTO<T> {
  const factory _BaseDataDTO({@JsonKey(name: 'data') required final T data}) =
      _$BaseDataDTOImpl<T>;

  @override

  /// Data dynamic from service
  @JsonKey(name: 'data')
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$BaseDataDTOImplCopyWith<T, _$BaseDataDTOImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
