
import '../../model/DatabaseHandler.dart';
import 'package:japanimationbloc/modelview/entities/thing.dart';

import 'package:bloc/bloc.dart';

part 'japan_event.dart';
part 'japan_state.dart';

class JapanBloc extends Bloc<JapanEvent, JapanState>{
  JapanBloc() : super(InitState(things: [], categories: [], currentCategory: Category.empty(), handler: DatabaseHandler(), allCategories: [], allThings: [], currentThing: Thing.empty(), spes: [], currentSpe: Spe.empty())) {
    on<JapanEvent>(onJapanEvent);
  }

  onJapanEvent(JapanEvent event, Emitter<JapanState> emit) async {
    switch(event.runtimeType) {
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
          currentSpe: state.currentSpe
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
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
          currentSpe: state.currentSpe,
          allThings: state.allThings
        );
        await nextState.change((event as ChangeThingEvent).thing);
        emit(nextState);
        break;
    }
  }
}
