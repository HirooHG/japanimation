import 'package:japanimationbloc/data/model/base_model.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spe_model.g.dart';

@JsonSerializable()
class SpeModel extends BaseModel {
  final String name;

  const SpeModel({
    required super.id,
    required this.name,
  });

  factory SpeModel.fromJson(Map<String, dynamic> json) => _$SpeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpeModelToJson(this);

  @override
  Spe toEntity() => Spe(
    id: id,
    name: name
  );

  @override
  List<Object?> get props => [
    id,
    name
  ];
}
