
import 'package:japanimationbloc/domain/entities/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_token.g.dart';

@JsonSerializable()
class UserToken extends BaseEntity {
  final String name;
  final String pwd;

  const UserToken({
    required super.id,
    required this.name,
    required this.pwd,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) => _$UserTokenFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserTokenToJson(this);

  @override
  bool operator ==(Object other) {
    return other is UserToken
      && other.id == id;
  }

  @override
  int get hashCode => int.parse(id?.split("")
      .where((element) => int.tryParse(element) != null)
      .join()
      .substring(0, 6) ?? "-1");

  @override
  List<Object?> get props => [
    id,
    name,
    pwd
  ];
}
