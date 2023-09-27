// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    Advertisement(
      id: json['_id'] as String?,
      name: json['name'] as String,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      spe: json['spe'] == null
          ? null
          : Spe.fromJson(json['spe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'spe': instance.spe,
    };
