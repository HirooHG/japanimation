import 'package:json_annotation/json_annotation.dart';

part 'specification.g.dart';

@JsonSerializable()
class Specification {
  int? id;
  String name;

  Specification({required this.name, this.id});
  Specification.empty() : this(name: '');
  factory Specification.fromJson(Map<String, dynamic> map) =>
      _$SpecificationFromJson(map);

  Map<String, Object?> toJson() => _$SpecificationToJson(this);

  @override
  bool operator ==(Object other) {
    return name == (other as Specification).name;
  }
}
