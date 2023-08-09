part of 'japan_bloc.dart';

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
