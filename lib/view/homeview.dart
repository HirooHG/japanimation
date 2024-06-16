import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:japanimationbloc/modelview/thing/japanbloc.dart';
import 'package:japanimationbloc/model/DatabaseHandler.dart';
import 'package:japanimationbloc/modelview/thing/thing.dart';
import 'package:japanimationbloc/modelview/thing/japancubit.dart';
import 'thingsview.dart';
import 'thingview.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  late double width;
  late double height;
  late final handler = DatabaseHandler();

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    //handler.initializeDB().then((db) async {
    //});

    if (!isLoaded) {
      BlocProvider.of<JapanBloc>(context).add(const InitEvent());
      isLoaded = true;
    }

    return Scaffold(
      floatingActionButton: MultiBlocProvider(providers: [
        BlocProvider.value(value: BlocProvider.of<ModifyJapanCubit>(context)),
        BlocProvider.value(value: BlocProvider.of<JapanBloc>(context))
      ], child: FloatingButtons(tag: "homeview")),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF1a1a1a),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: height * 0.2,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2f2f2f),
                  ),
                  child: Center(
                      child: Text(
                    "Japanimation",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            Color(0xFF42d392),
                            Color(0xFF4fb2bd),
                            Color(0xFF5f8bee),
                          ],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 100.0, 350.0, 70.0)),
                    ),
                  ))),
              BlocBuilder<JapanBloc, JapanState>(builder: (context, state) {
                List<Category> categories = state.categories;
                return SizedBox(
                    width: width,
                    height: height * 0.1,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          Category category = categories[index];
                          return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: height * 0.2,
                              child: Center(
                                child: ChoiceChip(
                                  label: Text(category.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Ubuntu")),
                                  onSelected: (selected) {
                                    if (state.currentCategory == category) {
                                      BlocProvider.of<JapanBloc>(context).add(
                                          SelectCategoryEvent(
                                              category: Category.empty()));
                                    } else {
                                      BlocProvider.of<JapanBloc>(context).add(
                                          SelectCategoryEvent(
                                              category: category));
                                    }
                                  },
                                  selectedColor: const Color(0xFF42d392),
                                  selected: state.currentCategory == category,
                                ),
                              ));
                        }));
              }),
              BlocBuilder<JapanBloc, JapanState>(builder: (_, state) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                          (state.currentCategory.name == '')
                              ? "All"
                              : state.currentCategory.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Ubuntu")),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return MultiBlocProvider(providers: [
                              BlocProvider<JapanBloc>.value(
                                value: BlocProvider.of<JapanBloc>(context),
                              ),
                              BlocProvider<ModifyJapanCubit>.value(
                                value:
                                    BlocProvider.of<ModifyJapanCubit>(context),
                              ),
                            ], child: ThingsView());
                          }));
                        },
                      )
                    ],
                  ),
                );
              }),
              BlocBuilder<JapanBloc, JapanState>(builder: (context, state) {
                List<Thing> things = state.things;
                return Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: things.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.8,
                        ),
                        itemBuilder: (context, index) {
                          Thing thing = things[index];
                          return Center(
                              child: TextButton(
                                  onPressed: () {
                                    BlocProvider.of<JapanBloc>(context)
                                        .add(SelectThingEvent(thing: thing));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => BlocProvider.value(
                                                value:
                                                    BlocProvider.of<JapanBloc>(
                                                        context),
                                                child: ThingView())));
                                  },
                                  child: Text(thing.name,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF42d392)))));
                        }));
              })
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingButtons extends StatelessWidget {
  FloatingButtons({super.key, required this.tag});

  void removeBottomSheet({required BuildContext context}) {
    var controller = TextEditingController();

    Scaffold.of(context).showBottomSheet((_) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<ModifyJapanCubit>.value(
              value: BlocProvider.of<ModifyJapanCubit>(context),
            ),
            BlocProvider<JapanBloc>.value(
              value: BlocProvider.of<JapanBloc>(context),
            ),
          ],
          child: Container(
            color: const Color(0xFF2a2a2a),
            height: height * 0.4,
            width: width,
            child: BlocBuilder<ModifyJapanCubit, String>(
                builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.025),
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
                  BlocBuilder<JapanBloc, JapanState>(
                    builder: (context, japanState) {
                      var things = japanState.things;
                      var categories = japanState.categories;
                      var thingsStr = things.map((e) => e.name).toList();
                      var categoriesStr =
                          categories.map((e) => e.name).toList();
                      return SizedBox(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 20),
                              SizedBox(
                                width: width * 0.5,
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
                                          width: width * 0.6,
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
                                            BlocProvider.of<JapanBloc>(context)
                                                .add(RemoveCategoryEvent(
                                                    category: Category(
                                                        name:
                                                            controller.text)));
                                          } else {
                                            BlocProvider.of<JapanBloc>(context)
                                                .add(RemoveThingEvent(
                                                    thing: Thing(
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
            height: height * 0.3,
            width: width,
            child: BlocBuilder<ModifyJapanCubit, String>(
                builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.025),
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
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 20),
                              SizedBox(
                                  width: width * 0.5,
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
                                            BlocProvider.of<JapanBloc>(context)
                                                .add(AddCategoryEvent(
                                                    category: Category(
                                                        name:
                                                            controller.text)));
                                          } else {
                                            BlocProvider.of<JapanBloc>(context)
                                                .add(AddThingEvent(
                                                    thing: Thing(
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

  late double width;
  late double height;
  final String tag;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
