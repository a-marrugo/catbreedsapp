// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_breed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatBreedDTOImpl _$$CatBreedDTOImplFromJson(Map<String, dynamic> json) =>
    _$CatBreedDTOImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['reference_image_id'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      description: json['description'] as String?,
      lifeSpan: json['life_span'] as String?,
      wikipediaUrl: json['wikipedia_url'] as String?,
    );

Map<String, dynamic> _$$CatBreedDTOImplToJson(_$CatBreedDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'reference_image_id': instance.imageUrl,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'life_span': instance.lifeSpan,
      'wikipedia_url': instance.wikipediaUrl,
    };
