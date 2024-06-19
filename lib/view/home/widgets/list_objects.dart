import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';
import 'package:japanimationbloc/view/animation_entity/animation_entity_view.dart';

class ListObjects extends StatelessWidget {
  const ListObjects({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      List<AnimationEntity> things = state.things;
      return Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: things.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) {
                AnimationEntity thing = things[index];
                return Center(
                    child: TextButton(
                        onPressed: () {
                          BlocProvider.of<MainBloc>(context)
                              .add(SelectThingEvent(thing: thing));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                      value: BlocProvider.of<MainBloc>(context),
                                      child: AnimationEntityView())));
                        },
                        child: Text(thing.name,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF42d392)))));
              }));
    });
  }
}
