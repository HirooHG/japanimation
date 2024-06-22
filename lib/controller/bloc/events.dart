part of 'bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class GetAll extends MainEvent {
  const GetAll();
}

class AddEntity extends MainEvent {
  const AddEntity(
      {required this.name,
      required this.option,
      this.onComplete,
      this.onError});

  final Options option;
  final String name;
  final Function(AnimationEntity? entity)? onComplete;
  final Function(Options options)? onError;
}

class RemoveEntity<T extends BaseEntity> extends MainEvent {
  const RemoveEntity({required this.entity, this.onComplete, this.onError});

  final T entity;
  final Function()? onComplete;
  final Function? onError;
}

class UpdateEntity<T extends BaseEntity> extends MainEvent {
  const UpdateEntity({required this.entity, this.onComplete, this.onError});

  final T entity;

  final Function()? onComplete;
  final Function? onError;
}
