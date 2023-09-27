
import 'package:equatable/equatable.dart';
import 'package:japanimationbloc/domain/entities/base_entity.dart';

abstract class BaseModel<T extends BaseEntity> extends Equatable {

  const BaseModel({
    required this.id
  });

  final String id;

  Map<String, dynamic> toJson();

  T toEntity();
}
