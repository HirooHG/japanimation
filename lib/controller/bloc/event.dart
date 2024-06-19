// Event
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';

abstract class MainEvent {
  const MainEvent();
}

class InitEvent extends MainEvent {
  const InitEvent();
}

class AddCategoryEvent extends MainEvent {
  const AddCategoryEvent({required this.category});

  final Category category;
}

class RemoveCategoryEvent extends MainEvent {
  const RemoveCategoryEvent({required this.category});

  final Category category;
}

class SelectCategoryEvent extends MainEvent {
  const SelectCategoryEvent({required this.category});

  final Category category;
}

class AddThingEvent extends MainEvent {
  const AddThingEvent({required this.thing});

  final AnimationEntity thing;
}

class RemoveThingEvent extends MainEvent {
  const RemoveThingEvent({required this.thing});

  final AnimationEntity thing;
}

class SearchThingEvent extends MainEvent {
  const SearchThingEvent();
}

class SelectThingEvent extends MainEvent {
  const SelectThingEvent({required this.thing});

  final AnimationEntity thing;
}

class ChangeThingEvent extends MainEvent {
  const ChangeThingEvent({required this.thing});

  final AnimationEntity thing;
}
