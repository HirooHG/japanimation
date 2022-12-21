
import '../../model/DatabaseHandler.dart';
import 'thing.dart';

import 'package:bloc/bloc.dart';

// Event
abstract class JapanEvent {
  const JapanEvent();
}
class InitEvent extends JapanEvent {
  const InitEvent();
}

class AddCategoryEvent extends JapanEvent {
  const AddCategoryEvent({required this.category});

  final Category category;
}
class RemoveCategoryEvent extends JapanEvent {
  const RemoveCategoryEvent({required this.category});

  final Category category;
}
class SelectCategoryEvent extends JapanEvent {
  const SelectCategoryEvent({required this.category});

  final Category category;
}

class AddThingEvent extends JapanEvent {
  const AddThingEvent({required this.thing});

  final Thing thing;
}
class RemoveThingEvent extends JapanEvent {
  const RemoveThingEvent({required this.thing});

  final Thing thing;
}
class SearchThingEvent extends JapanEvent {
  const SearchThingEvent();
}
class SelectThingEvent extends JapanEvent {
  const SelectThingEvent({required this.thing});

  final Thing thing;
}
class ChangeThingEvent extends JapanEvent {
  const ChangeThingEvent({required this.thing});

  final Thing thing;
}


// State
abstract class JapanState {
  List<Thing> things;
  List<Category> categories;

  List<Thing> allThings;
  List<Category> allCategories;

  Category currentCategory;
  Thing currentThing;
  final DatabaseHandler handler;

  JapanState({
    required this.things,
    required this.categories,
    required this.handler,
    required this.allCategories,
    required this.allThings,
    required this.currentCategory,
    required this.currentThing
  });
}
class InitState extends JapanState {
  InitState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});

  init() async {
    List<Thing> newtThings = await handler.getThings();
    List<Category> newCategories = await handler.getCategories();
    things.clear();
    allThings.clear();
    allCategories.clear();
    categories.clear();

    things.addAll(newtThings);
    categories.addAll(newCategories);

    allThings.addAll(things);
    allCategories.addAll(categories);
  }
}

class AddedCategoryState extends JapanState {
  AddedCategoryState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});

  Future add(Category category) async {
    categories.add(category);
    allCategories.add(category);
    await handler.insertCategory(category);
  }
}
class RemovedCategoryState extends JapanState {
  RemovedCategoryState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});

  Future remove(Category category) async {
    Category categoryF = categories.singleWhere((element) => category.name == element.name);
    categories.remove(categoryF);
    allCategories.remove(categoryF);
    await handler.deleteCategory(categoryF);
  }
}
class SelectedCategoryState extends JapanState {
  SelectedCategoryState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});

  changeThings(Category category) {
    if(category.name == "") {
      things.clear();
      things.addAll(allThings);
    }
    else {
      things = allThings.where((element) => element.idCategorie == category.id).toList();
    }
  }
}

class AddedThingState extends JapanState {
  AddedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});

  Future add(Thing thing) async {
    things.add(thing);
    allThings.add(thing);
    await handler.insertThing(thing);
  }
}
class RemovedThingState extends JapanState {
  RemovedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});

  Future remove(Thing thing) async {
    Thing thingF = allThings.singleWhere((element) => thing.name == element.name);
    things.remove(thingF);
    allThings.remove(thingF);
    await handler.deleteThing(thingF);
  }
}
class SearchedThingState extends JapanState {
  SearchedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});
}
class SelectedThingState extends JapanState {
  SelectedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing});
}
class ChangedThingState extends JapanState {
  ChangedThingState({required super.things, required super.categories, required super.handler, required super.allCategories, required super.allThings, required super.currentCategory, required super.currentThing});

  Future change(Thing thing) async {
    await handler.updateThing(thing);
  }
}

class JapanBloc extends Bloc<JapanEvent, JapanState>{
  JapanBloc() : super(InitState(things: [], categories: [], currentCategory: Category.empty(), handler: DatabaseHandler(), allCategories: [], allThings: [], currentThing: Thing.empty())) {
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
          allThings: state.allThings
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
          allThings: state.allThings
        );
        await nextState.change((event as ChangeThingEvent).thing);
        emit(nextState);
        break;
    }
  }
}