import 'package:japanimationbloc/domain/entities/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends BaseEntity {
  final String name;

  const Category({
    required super.id, required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  bool operator ==(Object other) {
    return other is Category 
      && other.id == id;
  }

  @override
  int get hashCode => -1;

  @override
  List<Object?> get props => [
    id,
    name
  ];
}
