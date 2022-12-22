
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homeview.dart';
import 'package:japanimationbloc/modelview/thing/japanbloc.dart';
import 'package:japanimationbloc/modelview/thing/thing.dart';
import 'package:japanimationbloc/modelview/thing/japancubit.dart';
import 'thingview.dart';

class ThingsView extends StatelessWidget {
  ThingsView({super.key});

  final TextEditingController searchController = TextEditingController();

  late double width;
  late double height;

  String searchThing = "";

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: BlocProvider.of<ModifyJapanCubit>(context)),
          BlocProvider.value(value: BlocProvider.of<JapanBloc>(context))
        ],
        child: FloatingButtons(tag: "thingview")
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF1a1a1a),
          child: Column(
            children: [
              BlocBuilder<JapanBloc, JapanState>(
                builder: (context, state) {
                  var spes = state.spes;
                  return Column(
                    children: [
                      SizedBox(
                        height: height * 0.15,
                        child: Center(
                          child: Text(
                            (state.currentCategory.name == '') ? "All" : state.currentCategory.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu"
                            ),
                          )
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height * 0.1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: spes.length,
                          itemBuilder: (context, index) {
                            Spe spe = spes[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              height: height * 0.2,
                              child: Center(
                                child: ChoiceChip(
                                  label: Text(spe.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu"
                                    )
                                  ),
                                  onSelected: (selected) {
                                    if(state.currentSpe == spe) {
                                    }
                                    else {
                                    }
                                  },
                                  selectedColor: const Color(0xFF42d392),
                                  selected: state.currentSpe == spe
                                ),
                              )
                            );
                          }
                        )
                      )
                    ],
                  );
                },
              ),
              Container(
                width: width,
                height: height * 0.15,
                padding: EdgeInsets.only(left: 10, right: width * 0.3),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF42d392),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: TextField(
                      cursorColor: const Color(0xFF42d392),
                      controller: searchController,
                      style: const TextStyle(
                        fontFamily: "Ubuntu"
                      ),
                      onChanged: (value) {
                        searchThing = value;
                        BlocProvider.of<JapanBloc>(context).add(const SearchThingEvent());
                      },
                      decoration: const InputDecoration(
                        labelText: "Search",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Ubuntu"
                        ),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<JapanBloc, JapanState>(
                  builder: (context, state) {
                    var searchedThings = <Thing>[];
                    searchedThings.addAll(state.things.where((element) => element.idSpe == state.currentSpe.id));
                    searchedThings.retainWhere((s){
                      return s.name.contains(searchThing.toLowerCase());
                    });
                    return ListView.builder(
                      itemCount: searchedThings.length,
                      itemBuilder: (context, index) {
                        Thing thing = searchedThings[index];
                        return ListTile(
                          leading: const Icon(Icons.arrow_forward, color: Colors.white),
                          title: TextButton(
                            onPressed: () {
                              BlocProvider.of<JapanBloc>(context).add(SelectThingEvent(thing: thing));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(value: BlocProvider.of<JapanBloc>(context), child: ThingView())
                                )
                              );
                            },
                            child: Text(
                              thing.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Ubuntu"
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}