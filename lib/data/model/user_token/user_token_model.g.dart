// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenModel _$UserTokenModelFromJson(Map<String, dynamic> json) => UserTokenModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      pwd: json['pwd'] as String,
    );

Map<String, dynamic> _$UserTokenModelToJson(UserTokenModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'pwd': instance.pwd,
    };
