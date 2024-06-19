import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/db/database_handler.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(InitState(
            things: [],
            categories: [],
            currentCategory: Category.empty(),
            handler: const DatabaseHandler(),
            allCategories: [],
            allThings: [],
            currentThing: AnimationEntity.empty(),
            spes: [],
            currentSpeciality: Specification.empty())) {
    on<MainEvent>(onJapanEvent);
  }

  onJapanEvent(MainEvent event, Emitter<MainState> emit) async {
    switch (event.runtimeType) {
      case InitEvent:
        final nextState = InitState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            allThings: state.allThings,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality);
        await nextState.init();
        emit(nextState);
        break;
      case AddCategoryEvent:
        final nextState = AddedCategoryState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        await nextState.add((event as AddCategoryEvent).category);
        emit(nextState);
        break;
      case RemoveCategoryEvent:
        final nextState = RemovedCategoryState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        await nextState.remove((event as RemoveCategoryEvent).category);
        emit(nextState);
        break;
      case AddThingEvent:
        final nextState = AddedThingState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        await nextState.add((event as AddThingEvent).thing);
        emit(nextState);
        break;
      case RemoveThingEvent:
        final nextState = RemovedThingState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        await nextState.remove((event as RemoveThingEvent).thing);
        emit(nextState);
        break;
      case SelectCategoryEvent:
        final nextState = SelectedCategoryState(
            things: state.things,
            categories: state.categories,
            currentCategory: (event as SelectCategoryEvent).category,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        nextState.changeThings(event.category);
        emit(nextState);
        break;
      case SearchThingEvent:
        final nextState = SearchedThingState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        emit(nextState);
        break;
      case SelectThingEvent:
        final nextState = SelectedCategoryState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: (event as SelectThingEvent).thing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        emit(nextState);
        break;
      case ChangeThingEvent:
        final nextState = ChangedThingState(
            things: state.things,
            categories: state.categories,
            currentCategory: state.currentCategory,
            currentThing: state.currentThing,
            handler: state.handler,
            allCategories: state.allCategories,
            spes: state.spes,
            currentSpeciality: state.currentSpeciality,
            allThings: state.allThings);
        await nextState.change((event as ChangeThingEvent).thing);
        emit(nextState);
        break;
    }
  }
}
