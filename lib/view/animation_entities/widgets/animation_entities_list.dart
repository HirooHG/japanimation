import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/view/animation_entity/animation_entity_view.dart';

class AnimationEntitiesList extends StatelessWidget {
  const AnimationEntitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.things.length,
            itemBuilder: (context, index) {
              AnimationEntity thing = state.things[index];
              return ListTile(
                leading: const Icon(Icons.arrow_forward, color: Colors.white),
                title: TextButton(
                  onPressed: () {
                    BlocProvider.of<MainBloc>(context)
                        .add(SelectThingEvent(thing: thing));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<MainBloc>(context),
                                child: const AnimationEntityView())));
                  },
                  child: Text(
                    thing.name,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "Ubuntu"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
