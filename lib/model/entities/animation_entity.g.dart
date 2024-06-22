// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationEntity _$AnimationEntityFromJson(Map<String, dynamic> json) =>
    AnimationEntity(
      name: json['name'] as String,
      identifier: json['identifier'] as String,
      id: (json['id'] as num?)?.toInt(),
      category: (json['category'] as num?)?.toInt(),
      specification: (json['specification'] as num?)?.toInt(),
      episode: (json['episode'] as num?)?.toInt(),
      season: (json['season'] as num?)?.toInt(),
      chapter: (json['chapter'] as num?)?.toInt(),
      tome: (json['tome'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AnimationEntityToJson(AnimationEntity instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'id': instance.id,
      'category': instance.category,
      'specification': instance.specification,
      'episode': instance.episode,
      'season': instance.season,
      'chapter': instance.chapter,
      'tome': instance.tome,
    };
