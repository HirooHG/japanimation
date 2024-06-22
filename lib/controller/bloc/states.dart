// State

part of 'bloc.dart';

abstract class MainState {
  const MainState();
}

class MainLoading extends MainState {
  const MainLoading();
}

class MainError extends MainState {
  const MainError();
}

class MainLoaded extends MainState {
  const MainLoaded(
      {required this.animationEntities,
      required this.categories,
      required this.spes});

  final List<AnimationEntity> animationEntities;
  final List<Category> categories;
  final List<Specification> spes;

  void addEntity(BaseEntity entity) {
    if (entity is AnimationEntity) {
      animationEntities.add(entity);
    } else if (entity is Category) {
      categories.add(entity);
    } else if (entity is Specification) {
      spes.add(entity);
    }
  }

  void removeEntity(BaseEntity entity) {
    if (entity is AnimationEntity) {
      animationEntities.remove(entity);
    } else if (entity is Category) {
      categories.remove(entity);
    } else if (entity is Specification) {
      spes.remove(entity);
    }
  }

  void updateEntity(BaseEntity entity) {
    if (entity is AnimationEntity) {
      final index = animationEntities.indexWhere((e) => e.id == entity.id);
      animationEntities[index] = entity;
    } else if (entity is Category) {
      final index = categories.indexWhere((e) => e.id == entity.id);
      categories[index] = entity;
    } else if (entity is Specification) {
      final index = spes.indexWhere((e) => e.id == entity.id);
      spes[index] = entity;
    }
  }
}
