import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';
import 'package:japanimationbloc/controller/cubit/japancubit.dart';
import 'package:japanimationbloc/view/animation_entities/animation_entities_view.dart';

class FilteredListButton extends StatelessWidget {
  const FilteredListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (_, state) {
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
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MultiBlocProvider(providers: [
                    BlocProvider<MainBloc>.value(
                      value: BlocProvider.of<MainBloc>(context),
                    ),
                    BlocProvider<ModifyJapanCubit>.value(
                      value: BlocProvider.of<ModifyJapanCubit>(context),
                    ),
                  ], child: AnimationEntitiesView());
                }));
              },
            )
          ],
        ),
      );
    });
  }
}
