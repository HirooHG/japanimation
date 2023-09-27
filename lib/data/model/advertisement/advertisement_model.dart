
import 'package:japanimationbloc/data/model/base_model.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advertisement_model.g.dart';

@JsonSerializable()
class AdvertisementModel extends BaseModel {
  final String name;
  final Category? category;
  final Spe? spe;

  const AdvertisementModel({
    required super.id,
    required this.name,
    this.category,
    this.spe,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => _$AdvertisementModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);

  @override
  Advertisement toEntity() => Advertisement(
    id: id,
    name: name,
    category: category,
    spe: spe,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    spe
  ];
}
