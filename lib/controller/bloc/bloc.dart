import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';
import 'package:japanimationbloc/model/db/database_handler.dart';
import 'package:japanimationbloc/model/entities/base_entity.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';

part 'events.dart';
part 'states.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainLoading()) {
    on<GetAll>(getAll);

    on<AddEntity>(addEntity);

    on<RemoveEntity>(removeEntity);

    on<UpdateEntity>(updateEntity);
  }

  final DatabaseHandler _handler = DatabaseHandler();

  Future<void> getAll(GetAll event, Emitter<MainState> emit) async {
    try {
      final List<AnimationEntity> animations =
          await _handler.getAnimationEntities();
      final List<Category> categories = await _handler.getCategories();
      final List<Specification> specifications =
          await _handler.getSpecifications();
      emit(MainLoaded(
          animationEntities: animations,
          categories: categories,
          spes: specifications));
    } catch (e) {
      emit(const MainError());
    }
  }

  Future<void> addEntity(AddEntity event, Emitter<MainState> emit) async {
    final MainLoaded currentState = state as MainLoaded;
    emit(const MainLoading());
    final name = event.name;
    final BaseEntity entity;

    switch (event.option) {
      case Options.category:
        entity = Category.empty(name: name);
        break;
      case Options.specification:
        entity = Specification.empty(name: name);
        break;
      default:
        entity = AnimationEntity.empty(name: name);
    }

    final result = await _handler.insertEntity(entity);

    if (result != null) {
      final newEntity = await _handler.getEntityByIdentifier(entity);
      currentState.addEntity(newEntity);
      event.onComplete?.call(entity is AnimationEntity ? entity : null);
    } else {
      event.onError?.call(event.option);
    }
    emit(currentState);
  }

  Future<void> removeEntity(RemoveEntity event, Emitter<MainState> emit) async {
    final MainLoaded currentState = state as MainLoaded;
    emit(const MainLoading());
    final result = await _handler.deleteEntity(event.entity);

    if (result != null) {
      currentState.removeEntity(event.entity);
      event.onComplete?.call();
    } else {
      event.onError?.call();
    }
    emit(currentState);
  }

  Future<void> updateEntity(UpdateEntity event, Emitter<MainState> emit) async {
    final MainLoaded currentState = state as MainLoaded;
    emit(const MainLoading());
    final result = await _handler.updateEntity(event.entity);

    if (result != null) {
      currentState.updateEntity(event.entity);
      event.onComplete?.call();
    } else {
      event.onError?.call();
    }
    emit(currentState);
  }
}
