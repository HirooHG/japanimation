import 'package:japanimationbloc/model/entities/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'animation_entity.g.dart';

@JsonSerializable()
class AnimationEntity extends BaseEntity {
  final int? id;

  String name;

  int? category;
  int? specification;
  int? episode;
  int? season;
  int? chapter;
  int? tome;

  AnimationEntity({
    required this.name,
    required super.identifier,
    this.id,
    this.category,
    this.specification,
    this.episode,
    this.season,
    this.chapter,
    this.tome,
  });

  AnimationEntity.empty({required this.name})
      : id = null,
        category = null,
        specification = null,
        episode = null,
        season = null,
        chapter = null,
        tome = null,
        super(identifier: const Uuid().v4().toString());

  factory AnimationEntity.fromJson(Map<String, dynamic> map) =>
      _$AnimationEntityFromJson(map);

  @override
  String get className => 'animationEntity';

  @override
  Map<String, Object?> toJson() => _$AnimationEntityToJson(this);

  @override
  bool operator ==(Object other) {
    return other is AnimationEntity && other.identifier == identifier;
  }

  @override
  int get hashCode => identifier.hashCode;
}
