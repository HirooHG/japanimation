import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/view/animation_entities/widgets/animation_entities_list.dart';
import 'package:japanimationbloc/view/animation_entities/widgets/header_name_category.dart';
import 'package:japanimationbloc/view/animation_entities/widgets/search_field.dart';
import 'package:japanimationbloc/view/animation_entities/widgets/specifications_list.dart';
import 'package:japanimationbloc/view/home/widgets/floating_button.dart';

import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/cubit/japancubit.dart';

class AnimationEntitiesView extends StatelessWidget {
  const AnimationEntitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: MultiBlocProvider(providers: [
          BlocProvider.value(value: BlocProvider.of<ModifyJapanCubit>(context)),
          BlocProvider.value(value: BlocProvider.of<MainBloc>(context))
        ], child: const FloatingButtons(tag: "thingview")),
        body: SafeArea(
          child: Container(
            color: const Color(0xFF1a1a1a),
            child: const Column(
              children: [
                Column(
                  children: [HeaderNameCategory(), SpecificationsList()],
                ),
                SearchField(),
                AnimationEntitiesList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
