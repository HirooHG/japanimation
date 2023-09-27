
import 'package:equatable/equatable.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';

abstract class BaseEntity extends Equatable {

  static Map<Type, String> mapAddableEntities = {
    Category: "category",
    Spe: "spe",
    Advertisement: "advertisement",
  };

  final String? id;

  const BaseEntity({
    this.id
  });

  Map<String, dynamic> toJson();
}
