
part of 'app_bloc.dart';

abstract class AppEvent {}

class GetAll extends AppEvent {}
class ReleadAll extends AppEvent {}

class ModifyEntity extends AppEvent {
  final BaseEntity entity;

  ModifyEntity({
    required this.entity
  });
}

class DeleteEntity extends AppEvent {
  final BaseEntity entity;

  DeleteEntity({
    required this.entity
  });
}

class AddEntity extends AppEvent {
  final BaseEntity entity;

  AddEntity({
    required this.entity
  });
}

class SelectCategory extends AppEvent {
  SelectCategory({
    required this.cat
  });

  final Category? cat;
}
class SelectSpe extends AppEvent {
  SelectSpe({
    required this.spe
  });

  final Spe? spe;
}
