
import 'package:japanimationbloc/data/model/base_model.dart';
import 'package:japanimationbloc/domain/entities/user_token/user_token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_token_model.g.dart';

@JsonSerializable()
class UserTokenModel extends BaseModel {
  final String name;
  final String pwd;

  const UserTokenModel({
    required super.id,
    required this.name,
    required this.pwd,
  });

  factory UserTokenModel.fromJson(Map<String, dynamic> json) => _$UserTokenModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserTokenModelToJson(this);

  @override
  UserToken toEntity() => UserToken(id: id, name: name, pwd: pwd);

  @override
  List<Object?> get props => [
    id,
    name,
    pwd
  ];
}
