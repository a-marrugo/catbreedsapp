// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat_breed_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CatBreedDTO _$CatBreedDTOFromJson(Map<String, dynamic> json) {
  return _CatBreedDTO.fromJson(json);
}

/// @nodoc
mixin _$CatBreedDTO {
  /// Unique identifier for the cat breed
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  /// Name of the cat breed
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// URL of the image representing the cat breed
  @JsonKey(name: 'reference_image_id')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Description of the cat breed's temperament (optional)
  @JsonKey(name: 'temperament')
  String? get temperament => throw _privateConstructorUsedError;

  /// Country or region of origin (optional)
  @JsonKey(name: 'origin')
  String? get origin => throw _privateConstructorUsedError;

  /// Detailed description of the cat breed (optional)
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  /// Average lifespan of the cat breed (optional)
  @JsonKey(name: 'life_span')
  String? get lifeSpan => throw _privateConstructorUsedError;

  /// URL to the Wikipedia page for the cat breed (optional)
  @JsonKey(name: 'wikipedia_url')
  String? get wikipediaUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatBreedDTOCopyWith<CatBreedDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatBreedDTOCopyWith<$Res> {
  factory $CatBreedDTOCopyWith(
          CatBreedDTO value, $Res Function(CatBreedDTO) then) =
      _$CatBreedDTOCopyWithImpl<$Res, CatBreedDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'reference_image_id') String? imageUrl,
      @JsonKey(name: 'temperament') String? temperament,
      @JsonKey(name: 'origin') String? origin,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'life_span') String? lifeSpan,
      @JsonKey(name: 'wikipedia_url') String? wikipediaUrl});
}

/// @nodoc
class _$CatBreedDTOCopyWithImpl<$Res, $Val extends CatBreedDTO>
    implements $CatBreedDTOCopyWith<$Res> {
  _$CatBreedDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? temperament = freezed,
    Object? origin = freezed,
    Object? description = freezed,
    Object? lifeSpan = freezed,
    Object? wikipediaUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      temperament: freezed == temperament
          ? _value.temperament
          : temperament // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lifeSpan: freezed == lifeSpan
          ? _value.lifeSpan
          : lifeSpan // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipediaUrl: freezed == wikipediaUrl
          ? _value.wikipediaUrl
          : wikipediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatBreedDTOImplCopyWith<$Res>
    implements $CatBreedDTOCopyWith<$Res> {
  factory _$$CatBreedDTOImplCopyWith(
          _$CatBreedDTOImpl value, $Res Function(_$CatBreedDTOImpl) then) =
      __$$CatBreedDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'reference_image_id') String? imageUrl,
      @JsonKey(name: 'temperament') String? temperament,
      @JsonKey(name: 'origin') String? origin,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'life_span') String? lifeSpan,
      @JsonKey(name: 'wikipedia_url') String? wikipediaUrl});
}

/// @nodoc
class __$$CatBreedDTOImplCopyWithImpl<$Res>
    extends _$CatBreedDTOCopyWithImpl<$Res, _$CatBreedDTOImpl>
    implements _$$CatBreedDTOImplCopyWith<$Res> {
  __$$CatBreedDTOImplCopyWithImpl(
      _$CatBreedDTOImpl _value, $Res Function(_$CatBreedDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? temperament = freezed,
    Object? origin = freezed,
    Object? description = freezed,
    Object? lifeSpan = freezed,
    Object? wikipediaUrl = freezed,
  }) {
    return _then(_$CatBreedDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      temperament: freezed == temperament
          ? _value.temperament
          : temperament // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lifeSpan: freezed == lifeSpan
          ? _value.lifeSpan
          : lifeSpan // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipediaUrl: freezed == wikipediaUrl
          ? _value.wikipediaUrl
          : wikipediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatBreedDTOImpl implements _CatBreedDTO {
  const _$CatBreedDTOImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'reference_image_id') this.imageUrl,
      @JsonKey(name: 'temperament') this.temperament,
      @JsonKey(name: 'origin') this.origin,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'life_span') this.lifeSpan,
      @JsonKey(name: 'wikipedia_url') this.wikipediaUrl});

  factory _$CatBreedDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatBreedDTOImplFromJson(json);

  /// Unique identifier for the cat breed
  @override
  @JsonKey(name: 'id')
  final String id;

  /// Name of the cat breed
  @override
  @JsonKey(name: 'name')
  final String name;

  /// URL of the image representing the cat breed
  @override
  @JsonKey(name: 'reference_image_id')
  final String? imageUrl;

  /// Description of the cat breed's temperament (optional)
  @override
  @JsonKey(name: 'temperament')
  final String? temperament;

  /// Country or region of origin (optional)
  @override
  @JsonKey(name: 'origin')
  final String? origin;

  /// Detailed description of the cat breed (optional)
  @override
  @JsonKey(name: 'description')
  final String? description;

  /// Average lifespan of the cat breed (optional)
  @override
  @JsonKey(name: 'life_span')
  final String? lifeSpan;

  /// URL to the Wikipedia page for the cat breed (optional)
  @override
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;

  @override
  String toString() {
    return 'CatBreedDTO(id: $id, name: $name, imageUrl: $imageUrl, temperament: $temperament, origin: $origin, description: $description, lifeSpan: $lifeSpan, wikipediaUrl: $wikipediaUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatBreedDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.temperament, temperament) ||
                other.temperament == temperament) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lifeSpan, lifeSpan) ||
                other.lifeSpan == lifeSpan) &&
            (identical(other.wikipediaUrl, wikipediaUrl) ||
                other.wikipediaUrl == wikipediaUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, temperament,
      origin, description, lifeSpan, wikipediaUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatBreedDTOImplCopyWith<_$CatBreedDTOImpl> get copyWith =>
      __$$CatBreedDTOImplCopyWithImpl<_$CatBreedDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatBreedDTOImplToJson(
      this,
    );
  }
}

abstract class _CatBreedDTO implements CatBreedDTO {
  const factory _CatBreedDTO(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'reference_image_id') final String? imageUrl,
          @JsonKey(name: 'temperament') final String? temperament,
          @JsonKey(name: 'origin') final String? origin,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'life_span') final String? lifeSpan,
          @JsonKey(name: 'wikipedia_url') final String? wikipediaUrl}) =
      _$CatBreedDTOImpl;

  factory _CatBreedDTO.fromJson(Map<String, dynamic> json) =
      _$CatBreedDTOImpl.fromJson;

  @override

  /// Unique identifier for the cat breed
  @JsonKey(name: 'id')
  String get id;
  @override

  /// Name of the cat breed
  @JsonKey(name: 'name')
  String get name;
  @override

  /// URL of the image representing the cat breed
  @JsonKey(name: 'reference_image_id')
  String? get imageUrl;
  @override

  /// Description of the cat breed's temperament (optional)
  @JsonKey(name: 'temperament')
  String? get temperament;
  @override

  /// Country or region of origin (optional)
  @JsonKey(name: 'origin')
  String? get origin;
  @override

  /// Detailed description of the cat breed (optional)
  @JsonKey(name: 'description')
  String? get description;
  @override

  /// Average lifespan of the cat breed (optional)
  @JsonKey(name: 'life_span')
  String? get lifeSpan;
  @override

  /// URL to the Wikipedia page for the cat breed (optional)
  @JsonKey(name: 'wikipedia_url')
  String? get wikipediaUrl;
  @override
  @JsonKey(ignore: true)
  _$$CatBreedDTOImplCopyWith<_$CatBreedDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
