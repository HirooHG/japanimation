// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specification _$SpecificationFromJson(Map<String, dynamic> json) =>
    Specification(
      name: json['name'] as String,
      identifier: json['identifier'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpecificationToJson(Specification instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'id': instance.id,
      'name': instance.name,
    };
