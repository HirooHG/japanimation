import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int? id;
  String name;

  Category({required this.name, this.id});
  Category.empty() : this(name: '');

  factory Category.fromJson(Map<String, dynamic> map) =>
      _$CategoryFromJson(map);

  Map<String, Object?> toJson() => _$CategoryToJson(this);

  @override
  bool operator ==(Object other) {
    return name == (other as Category).name;
  }
}
