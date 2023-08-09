part of 'japan_bloc.dart';

abstract class JapanState {
  List<Thing> things;
  List<Category> categories;
  List<Spe> spes;

  List<Thing> allThings;
  List<Category> allCategories;

  Spe currentSpe;
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
    required this.currentThing,
    required this.spes,
    required this.currentSpe
  });
}
class InitState extends JapanState {
  InitState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});

  init() async {
    List<Thing> newtThings = await handler.getThings();
    List<Category> newCategories = await handler.getCategories();
    List<Spe> newSpes = await handler.getAllSpe();

    spes.clear();
    things.clear();
    categories.clear();

    allThings.clear();
    allCategories.clear();

    spes.addAll(newSpes);
    things.addAll(newtThings);
    categories.addAll(newCategories);

    allThings.addAll(things);
    allCategories.addAll(categories);
  }
}

class AddedCategoryState extends JapanState {
  AddedCategoryState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});

  Future add(Category category) async {
    categories.add(category);
    allCategories.add(category);
    await handler.insertCategory(category);
  }
}
class RemovedCategoryState extends JapanState {
  RemovedCategoryState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});

  Future remove(Category category) async {
    Category categoryF = categories.singleWhere((element) => category.name == element.name);
    categories.remove(categoryF);
    allCategories.remove(categoryF);
    await handler.deleteCategory(categoryF);
  }
}
class SelectedCategoryState extends JapanState {
  SelectedCategoryState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});

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
  AddedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});

  Future add(Thing thing) async {
    things.add(thing);
    allThings.add(thing);
    await handler.insertThing(thing);
  }
}
class RemovedThingState extends JapanState {
  RemovedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});

  Future remove(Thing thing) async {
    Thing thingF = allThings.singleWhere((element) => thing.name == element.name);
    things.remove(thingF);
    allThings.remove(thingF);
    await handler.deleteThing(thingF);
  }
}
class SearchedThingState extends JapanState {
  SearchedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});
}
class SelectedThingState extends JapanState {
  SelectedThingState({required super.things, required super.categories, required super.currentCategory, required super.handler, required super.allCategories, required super.allThings, required super.currentThing, required super.spes, required super.currentSpe});
}
class ChangedThingState extends JapanState {
  ChangedThingState({required super.things, required super.categories, required super.handler, required super.allCategories, required super.allThings, required super.currentCategory, required super.currentThing, required super.spes, required super.currentSpe});

  Future change(Thing thing) async {
    await handler.updateThing(thing);
  }
}
