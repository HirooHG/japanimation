import 'package:japanimationbloc/data/model/base_model.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends BaseModel {
  final String id;
  final String name;

  const CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  Category toEntity() => Category(
    id: id,
    name: name
  );

  @override
  List<Object?> get props => [
    id,
    name
  ];
}
