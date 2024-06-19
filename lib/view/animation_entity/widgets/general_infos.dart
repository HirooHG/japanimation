import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';
import 'package:japanimationbloc/model/entities/category.dart';

class GeneralInfos extends StatelessWidget {
  const GeneralInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      var categories = <Category>[];
      if (categories.isEmpty) {
        categories.addAll(state.categories);
        categories.insert(0, Category.empty());
      }
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Infos :",
              style: TextStyle(
                  fontFamily: "Ubuntu", color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: const Color(0xFF42d392),
                borderRadius: BorderRadius.circular(8)),
            child: DropdownButton<Category>(
              borderRadius: BorderRadius.circular(8),
              underline: Container(),
              icon: Container(),
              dropdownColor: const Color(0xFF42d392),
              onChanged: (value) {
                if (value != null) {
                  state.currentThing.idCategorie = value.id;
                  BlocProvider.of<MainBloc>(context)
                      .add(ChangeThingEvent(thing: state.currentThing));
                }
              },
              value: categories.singleWhere(
                  (element) => element.id == state.currentThing.idCategorie),
              items: categories.map((e) {
                return DropdownMenuItem<Category>(
                  key: Key("key${e.name}"),
                  value: e,
                  child: Text(
                    (e.name == "") ? "No categorie" : e.name,
                    style: const TextStyle(
                        fontFamily: "Ubuntu", fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      );
    });
  }
}
