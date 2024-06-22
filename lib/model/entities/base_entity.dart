abstract class BaseEntity {
  final String identifier;

  const BaseEntity({required this.identifier});

  Map<String, dynamic> toJson();

  String get className;
}
