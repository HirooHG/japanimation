
import 'package:equatable/equatable.dart';
import 'package:japanimationbloc/domain/entities/base_entity.dart';

abstract class BaseModel<T extends BaseEntity> extends Equatable {

  const BaseModel();

  Map<String, dynamic> toJson();

  T toEntity();
}
