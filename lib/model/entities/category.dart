import 'package:japanimationbloc/model/entities/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends BaseEntity {
  final int? id;

  final String name;

  const Category({required this.name, required super.identifier, this.id});

  Category.empty({required this.name})
      : id = null,
        super(identifier: const Uuid().v4().toString());

  factory Category.fromJson(Map<String, dynamic> map) =>
      _$CategoryFromJson(map);

  @override
  Map<String, Object?> toJson() => _$CategoryToJson(this);

  @override
  bool operator ==(Object other) {
    return identifier == (other as Category).identifier;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String get className => 'category';
}
