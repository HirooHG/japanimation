import 'package:json_annotation/json_annotation.dart';

part 'animation_entity.g.dart';

@JsonSerializable()
class AnimationEntity {
  String name;

  int? id;
  int? idCategorie;
  int? idSpe;
  int? episode;
  int? season;
  int? chapter;
  int? tome;

  AnimationEntity({
    required this.name,
    this.idCategorie,
    this.idSpe,
    this.id,
    this.episode,
    this.season,
    this.chapter,
    this.tome,
  });

  AnimationEntity.empty() : this(name: '');
  factory AnimationEntity.fromJson(Map<String, dynamic> map) =>
      _$AnimationEntityFromJson(map);

  Map<String, Object?> toJson() => _$AnimationEntityToJson(this);

  @override
  bool operator ==(Object other) {
    return name == (other as AnimationEntity).name &&
        idCategorie == other.idCategorie &&
        episode == other.episode &&
        season == other.season &&
        chapter == other.chapter &&
        tome == other.tome &&
        idSpe == other.idSpe;
  }
}
