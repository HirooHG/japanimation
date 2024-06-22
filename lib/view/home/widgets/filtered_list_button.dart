import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/controller/cubit/current_category_cubit.dart';
import 'package:japanimationbloc/controller/cubit/search_cubit.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/view/animation_entities/animation_entities_view.dart';

class FilteredListButton extends StatelessWidget {
  const FilteredListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentCategoryCubit, Category?>(builder: (_, state) {
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Text((state != null) ? state.name : "All",
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
                    BlocProvider<CurrentCategoryCubit>.value(
                      value: BlocProvider.of<CurrentCategoryCubit>(context),
                    ),
                    BlocProvider.value(
                      value: BlocProvider.of<SearchCubit>(context),
                    ),
                  ], child: const AnimationEntitiesView());
                }));
              },
            )
          ],
        ),
      );
    });
  }
}
