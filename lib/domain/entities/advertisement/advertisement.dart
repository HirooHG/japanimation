
import 'package:japanimationbloc/domain/entities/base_entity.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advertisement.g.dart';

@JsonSerializable()
class Advertisement extends BaseEntity {
  final String name;
  final Category? category;
  final Spe? spe;

  const Advertisement({
    required super.id,
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
      && other.id == id;
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
