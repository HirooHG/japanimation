// State
import 'package:japanimationbloc/model/db/database_handler.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';

abstract class MainState {
  List<AnimationEntity> things;
  List<Category> categories;
  List<Specification> spes;

  List<AnimationEntity> allThings;
  List<Category> allCategories;

  Specification currentSpeciality;
  Category currentCategory;
  AnimationEntity currentThing;
  final DatabaseHandler handler;

  MainState(
      {required this.things,
      required this.categories,
      required this.handler,
      required this.allCategories,
      required this.allThings,
      required this.currentCategory,
      required this.currentThing,
      required this.spes,
      required this.currentSpeciality});
}

class InitState extends MainState {
  InitState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});

  init() async {
    List<AnimationEntity> newtThings = await handler.getThings();
    List<Category> newCategories = await handler.getCategories();
    List<Specification> newSpes = await handler.getAllSpe();

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

class AddedCategoryState extends MainState {
  AddedCategoryState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});

  Future add(Category category) async {
    categories.add(category);
    allCategories.add(category);
    await handler.insertCategory(category);
  }
}

class RemovedCategoryState extends MainState {
  RemovedCategoryState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});

  Future remove(Category category) async {
    Category categoryF =
        categories.singleWhere((element) => category.name == element.name);
    categories.remove(categoryF);
    allCategories.remove(categoryF);
    await handler.deleteCategory(categoryF);
  }
}

class SelectedCategoryState extends MainState {
  SelectedCategoryState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});

  changeThings(Category category) {
    if (category.name == "") {
      things.clear();
      things.addAll(allThings);
    } else {
      things = allThings
          .where((element) => element.idCategorie == category.id)
          .toList();
    }
  }
}

class AddedThingState extends MainState {
  AddedThingState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});

  Future add(AnimationEntity thing) async {
    things.add(thing);
    allThings.add(thing);
    await handler.insertThing(thing);
  }
}

class RemovedThingState extends MainState {
  RemovedThingState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});

  Future remove(AnimationEntity thing) async {
    AnimationEntity thingF =
        allThings.singleWhere((element) => thing.name == element.name);
    things.remove(thingF);
    allThings.remove(thingF);
    await handler.deleteThing(thingF);
  }
}

class SearchedThingState extends MainState {
  SearchedThingState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});
}

class SelectedThingState extends MainState {
  SelectedThingState(
      {required super.things,
      required super.categories,
      required super.currentCategory,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});
}

class ChangedThingState extends MainState {
  ChangedThingState(
      {required super.things,
      required super.categories,
      required super.handler,
      required super.allCategories,
      required super.allThings,
      required super.currentCategory,
      required super.currentThing,
      required super.spes,
      required super.currentSpeciality});

  Future change(AnimationEntity thing) async {
    await handler.updateThing(thing);
  }
}
