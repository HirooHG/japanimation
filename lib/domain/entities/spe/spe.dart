import 'package:japanimationbloc/domain/entities/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spe.g.dart';

@JsonSerializable()
class Spe extends BaseEntity {
  final String id;
  final String name;

  const Spe({
    required this.id,
    required this.name,
  });

  factory Spe.fromJson(Map<String, dynamic> json) => _$SpeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpeToJson(this);

  @override
  bool operator ==(Object other) {
    return other is Spe 
      && other.name == name 
      && other.id == other.id;
  }

  @override
  int get hashCode => 1;

  @override
  List<Object?> get props => [
    id,
    name
  ];
}
