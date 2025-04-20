// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseData<T> {
  /// Dynamic data parsed from some service
  T get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseDataCopyWith<T, BaseData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseDataCopyWith<T, $Res> {
  factory $BaseDataCopyWith(
          BaseData<T> value, $Res Function(BaseData<T>) then) =
      _$BaseDataCopyWithImpl<T, $Res, BaseData<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$BaseDataCopyWithImpl<T, $Res, $Val extends BaseData<T>>
    implements $BaseDataCopyWith<T, $Res> {
  _$BaseDataCopyWithImpl(this._value, this._then);

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
abstract class _$$BaseDataImplCopyWith<T, $Res>
    implements $BaseDataCopyWith<T, $Res> {
  factory _$$BaseDataImplCopyWith(
          _$BaseDataImpl<T> value, $Res Function(_$BaseDataImpl<T>) then) =
      __$$BaseDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$BaseDataImplCopyWithImpl<T, $Res>
    extends _$BaseDataCopyWithImpl<T, $Res, _$BaseDataImpl<T>>
    implements _$$BaseDataImplCopyWith<T, $Res> {
  __$$BaseDataImplCopyWithImpl(
      _$BaseDataImpl<T> _value, $Res Function(_$BaseDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseDataImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$BaseDataImpl<T> extends _BaseData<T> {
  const _$BaseDataImpl({required this.data}) : super._();

  /// Dynamic data parsed from some service
  @override
  final T data;

  @override
  String toString() {
    return 'BaseData<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseDataImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseDataImplCopyWith<T, _$BaseDataImpl<T>> get copyWith =>
      __$$BaseDataImplCopyWithImpl<T, _$BaseDataImpl<T>>(this, _$identity);
}

abstract class _BaseData<T> extends BaseData<T> {
  const factory _BaseData({required final T data}) = _$BaseDataImpl<T>;
  const _BaseData._() : super._();

  @override

  /// Dynamic data parsed from some service
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$BaseDataImplCopyWith<T, _$BaseDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
