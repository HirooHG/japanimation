import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';
import 'package:japanimationbloc/controller/cubit/japancubit.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key, required this.tag});

  final String tag;

  void removeBottomSheet({required BuildContext context}) {
    var controller = TextEditingController();

    Scaffold.of(context).showBottomSheet((_) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<ModifyJapanCubit>.value(
              value: BlocProvider.of<ModifyJapanCubit>(context),
            ),
            BlocProvider<MainBloc>.value(
              value: BlocProvider.of<MainBloc>(context),
            ),
          ],
          child: Container(
            color: const Color(0xFF2a2a2a),
            height: 300,
            width: double.infinity,
            child: BlocBuilder<ModifyJapanCubit, String>(
                builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChip(
                          label: const Text("category",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu")),
                          selectedColor: const Color(0xFF42d392),
                          selected: state == "category",
                          onSelected: (selected) => {
                            if (selected)
                              BlocProvider.of<ModifyJapanCubit>(context)
                                  .change("category")
                          },
                        ),
                        ChoiceChip(
                          label: const Text("thing",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu")),
                          selectedColor: const Color(0xFF42d392),
                          selected: state == "thing",
                          onSelected: (selected) => {
                            if (selected)
                              BlocProvider.of<ModifyJapanCubit>(context)
                                  .change("thing")
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<MainBloc, MainState>(
                    builder: (context, japanState) {
                      var things = japanState.things;
                      var categories = japanState.categories;
                      var thingsStr = things.map((e) => e.name).toList();
                      var categoriesStr =
                          categories.map((e) => e.name).toList();
                      return SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 20),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Autocomplete<String>(
                                  fieldViewBuilder: (context, controllerField,
                                      focusNode, onFieldSubmitted) {
                                    return TextField(
                                      cursorColor: const Color(0xFF42d392),
                                      style: const TextStyle(
                                          color: Color(0xFF42d392),
                                          fontFamily: "Ubuntu"),
                                      focusNode: focusNode,
                                      controller: controllerField,
                                      decoration: InputDecoration(
                                          labelText: "remove ${state}s",
                                          labelStyle: const TextStyle(
                                              color: Color(0xFF42d392),
                                              fontFamily: "Ubuntu"),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xFF42d392))),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xFF42d392)))),
                                    );
                                  },
                                  onSelected: (value) {
                                    controller.text = value;
                                  },
                                  optionsBuilder: (TextEditingValue value) {
                                    if (value.text == '') {
                                      return const Iterable<String>.empty();
                                    } else {
                                      List<String> matches = <String>[];
                                      if (state == "category") {
                                        matches.addAll(categoriesStr);
                                      } else {
                                        matches.addAll(thingsStr);
                                      }

                                      matches.retainWhere((s) {
                                        return s
                                            .toLowerCase()
                                            .contains(value.text.toLowerCase());
                                      });
                                      return matches;
                                    }
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          color: const Color(0xFF42d392),
                                          child: ListView.builder(
                                            itemCount: options.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var option = "";
                                              if (state == "category") {
                                                option =
                                                    options.toList()[index];
                                              } else {
                                                option =
                                                    options.toList()[index];
                                              }
                                              return GestureDetector(
                                                onTap: () {
                                                  onSelected(option);
                                                },
                                                child: ListTile(
                                                  title: Text(option,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Ubuntu")),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF5f8bee),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: TextButton(
                                      onPressed: () {
                                        if (controller.text.isNotEmpty) {
                                          if (state == "category") {
                                            BlocProvider.of<MainBloc>(context)
                                                .add(RemoveCategoryEvent(
                                                    category: Category(
                                                        name:
                                                            controller.text)));
                                          } else {
                                            BlocProvider.of<MainBloc>(context)
                                                .add(RemoveThingEvent(
                                                    thing: AnimationEntity(
                                                        name:
                                                            controller.text)));
                                          }
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text("Rem",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )))),
                            ],
                          ));
                    },
                  )
                ],
              );
            }),
          ));
    });
  }

  void addBottomSheet({required BuildContext context}) {
    var controller = TextEditingController();

    Scaffold.of(context).showBottomSheet((_) {
      return BlocProvider<ModifyJapanCubit>.value(
          value: BlocProvider.of<ModifyJapanCubit>(context),
          child: Container(
            color: const Color(0xFF2a2a2a),
            height: 200,
            width: double.infinity,
            child: BlocBuilder<ModifyJapanCubit, String>(
                builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChip(
                          label: const Text("category",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu")),
                          selectedColor: const Color(0xFF42d392),
                          selected: state == "category",
                          onSelected: (selected) => {
                            if (selected)
                              BlocProvider.of<ModifyJapanCubit>(context)
                                  .change("category")
                          },
                        ),
                        ChoiceChip(
                          label: const Text("thing",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu")),
                          selectedColor: const Color(0xFF42d392),
                          selected: state == "thing",
                          onSelected: (selected) => {
                            if (selected)
                              BlocProvider.of<ModifyJapanCubit>(context)
                                  .change("thing")
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 20),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: TextField(
                                    cursorColor: const Color(0xFF42d392),
                                    style: const TextStyle(
                                        color: Color(0xFF42d392),
                                        fontFamily: "Ubuntu"),
                                    controller: controller,
                                    decoration: InputDecoration(
                                        labelText: "new $state",
                                        labelStyle: const TextStyle(
                                            color: Color(0xFF42d392),
                                            fontFamily: "Ubuntu"),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF42d392))),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF42d392)))),
                                  )),
                              const SizedBox(width: 20),
                              Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF5f8bee),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: TextButton(
                                      onPressed: () {
                                        if (controller.text.isNotEmpty) {
                                          if (state == "category") {
                                            BlocProvider.of<MainBloc>(context)
                                                .add(AddCategoryEvent(
                                                    category: Category(
                                                        name:
                                                            controller.text)));
                                          } else {
                                            BlocProvider.of<MainBloc>(context)
                                                .add(AddThingEvent(
                                                    thing: AnimationEntity(
                                                        name:
                                                            controller.text)));
                                          }
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text("Add",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Ubuntu")))),
                            ],
                          )))
                ],
              );
            }),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "add$tag",
          elevation: 5.0,
          child: const Icon(Icons.add),
          onPressed: () {
            addBottomSheet(context: context);
          },
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: "remove$tag",
          child: const Icon(Icons.remove),
          onPressed: () {
            removeBottomSheet(context: context);
          },
        ),
      ],
    );
  }
}
