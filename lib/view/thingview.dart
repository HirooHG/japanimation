
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:japanimationbloc/modelview/thing/japanbloc.dart';
import 'package:japanimationbloc/modelview/thing/thing.dart';

class ThingView extends StatelessWidget {
  ThingView({super.key});

  late double width;
  late double height;

  final TextEditingController epController = TextEditingController();
  final TextEditingController chapterController = TextEditingController();
  final TextEditingController tomeController = TextEditingController();
  final TextEditingController seasonController = TextEditingController();

  Widget field({required TextEditingController controller, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: width * 0.5,
      child: TextField(
        keyboardType: TextInputType.phone,
        cursorColor: const Color(0xFF42d392),
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF42d392))),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF42d392))),
          label: Text(
            "$text :",
            style: const TextStyle(
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFF1a1a1a),
          child: BlocBuilder<JapanBloc, JapanState>(
            builder: (context, state) {
              var categories = <Category>[];
              if(categories.isEmpty) {
                categories.addAll(state.categories);
                categories.insert(0, Category.empty());
              }

              if(state.currentThing.season != null) {
                seasonController.text = (state.currentThing.season ?? "").toString();
              }
              if(state.currentThing.chapter != null) {
                chapterController.text = (state.currentThing.chapter ?? "").toString();
              }
              if(state.currentThing.tome != null) {
                tomeController.text = (state.currentThing.tome ?? "").toString();
              }
              if(state.currentThing.episode != null) {
                epController.text = (state.currentThing.season ?? "").toString();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            state.currentThing.name,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Ubuntu"
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Infos :",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.03, left: width * 0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF42d392),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: DropdownButton<Category>(
                      borderRadius: BorderRadius.circular(8),
                      underline: Container(),
                      icon: Container(),
                      dropdownColor: const Color(0xFF42d392),
                      onChanged: (value) {
                        if(value != null) {
                          state.currentThing.idCategorie = value.id;
                          BlocProvider.of<JapanBloc>(context).add(ChangeThingEvent(thing: state.currentThing));
                        }
                      },
                      value: categories.singleWhere((element) => element.id == state.currentThing.idCategorie) ?? Category.empty(),
                      items: categories.map((e) {
                        return DropdownMenuItem<Category>(
                          key: Key("key${e.name}"),
                          value: e,
                          child: Text(
                            (e.name == "") ? "No categorie" : e.name,
                            style: const TextStyle(
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: height * 0.55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  field(controller: epController, text: "Episode"),
                                  field(controller: chapterController, text: "Chapter"),
                                  field(controller: tomeController, text: "Tome"),
                                  field(controller: seasonController, text: "Season"),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF42d392),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    state.currentThing.episode = int.tryParse(epController.text);
                                    state.currentThing.chapter = int.tryParse(chapterController.text);
                                    state.currentThing.tome = int.tryParse(tomeController.text);
                                    state.currentThing.season = int.tryParse(seasonController.text);
                                    BlocProvider.of<JapanBloc>(context).add(ChangeThingEvent(thing: state.currentThing));
                                  },
                                  child: const Text(
                                    "Change",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu"
                                    ),
                                  ),
                                )
                              )
                            ],
                          )
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ),
      ),
    );
  }
}