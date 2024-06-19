import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';
import 'package:japanimationbloc/view/animation_entity/widgets/field.dart';

class FormFields extends StatelessWidget {
  FormFields({super.key});

  final TextEditingController epController = TextEditingController();
  final TextEditingController chapterController = TextEditingController();
  final TextEditingController tomeController = TextEditingController();
  final TextEditingController seasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          if (state.currentThing.season != null) {
            seasonController.text =
                (state.currentThing.season ?? "").toString();
          }
          if (state.currentThing.chapter != null) {
            chapterController.text =
                (state.currentThing.chapter ?? "").toString();
          }
          if (state.currentThing.tome != null) {
            tomeController.text = (state.currentThing.tome ?? "").toString();
          }
          if (state.currentThing.episode != null) {
            epController.text = (state.currentThing.season ?? "").toString();
          }

          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Field(controller: epController, text: "Episode"),
                      Field(controller: chapterController, text: "Chapter"),
                      Field(controller: tomeController, text: "Tome"),
                      Field(controller: seasonController, text: "Season"),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF42d392),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                        onPressed: () {
                          state.currentThing.episode =
                              int.tryParse(epController.text);
                          state.currentThing.chapter =
                              int.tryParse(chapterController.text);
                          state.currentThing.tome =
                              int.tryParse(tomeController.text);
                          state.currentThing.season =
                              int.tryParse(seasonController.text);
                          BlocProvider.of<MainBloc>(context)
                              .add(ChangeThingEvent(thing: state.currentThing));
                        },
                        child: const Text(
                          "Change",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu"),
                        ),
                      ))
                ],
              ));
        }),
      ),
    );
  }
}
