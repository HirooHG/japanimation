// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserToken _$UserTokenFromJson(Map<String, dynamic> json) => UserToken(
      id: json['_id'] as String?,
      name: json['name'] as String,
      pwd: json['pwd'] as String,
    );

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'pwd': instance.pwd,
    };
