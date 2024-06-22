import 'package:japanimationbloc/model/entities/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'specification.g.dart';

@JsonSerializable()
class Specification extends BaseEntity {
  final int? id;

  final String name;

  const Specification({required this.name, required super.identifier, this.id});

  Specification.empty({required this.name})
      : id = null,
        super(identifier: const Uuid().v4().toString());

  factory Specification.fromJson(Map<String, dynamic> map) =>
      _$SpecificationFromJson(map);

  @override
  Map<String, Object?> toJson() => _$SpecificationToJson(this);

  @override
  bool operator ==(Object other) {
    return identifier == (other as Specification).identifier;
  }

  @override
  int get hashCode => identifier.hashCode;

  @override
  String get className => 'specification';
}
