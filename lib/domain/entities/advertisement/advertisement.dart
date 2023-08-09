
import 'package:japanimationbloc/domain/entities/base_entity.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advertisement.g.dart';

@JsonSerializable()
class Advertisement extends BaseEntity {

  final int id;
  final String name;
  final Category? category;
  final Spe? spe;

  const Advertisement({
    required this.id,
    required this.name,
    required this.category,
    required this.spe,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) => _$AdvertisementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);

  @override
  bool operator ==(Object other) {
    return other is Advertisement 
        && name == other.name
        && category == other.category
        && spe == other.spe;
  }

  @override
  int get hashCode => 0;

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    spe
  ];
}
