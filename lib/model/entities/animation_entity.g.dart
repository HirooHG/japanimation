// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationEntity _$AnimationEntityFromJson(Map<String, dynamic> json) =>
    AnimationEntity(
      name: json['name'] as String,
      idCategorie: (json['idCategorie'] as num?)?.toInt(),
      idSpe: (json['idSpe'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      episode: (json['episode'] as num?)?.toInt(),
      season: (json['season'] as num?)?.toInt(),
      chapter: (json['chapter'] as num?)?.toInt(),
      tome: (json['tome'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AnimationEntityToJson(AnimationEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'idCategorie': instance.idCategorie,
      'idSpe': instance.idSpe,
      'episode': instance.episode,
      'season': instance.season,
      'chapter': instance.chapter,
      'tome': instance.tome,
    };
