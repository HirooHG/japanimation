import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:japanimationbloc/controller/cubit/current_specification_cubit.dart';
import 'package:japanimationbloc/view/animation_entities/widgets/header_name_category.dart';
import 'package:japanimationbloc/view/animation_entities/widgets/search_field.dart';
import 'package:japanimationbloc/view/animation_entities/widgets/specifications_list.dart';
import 'package:japanimationbloc/view/shared/floating_button.dart';
import 'package:japanimationbloc/view/shared/list_animation_entities.dart';

class AnimationEntitiesView extends StatelessWidget {
  const AnimationEntitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const FloatingButton(
          tag: "animation_entities_view",
        ),
        body: BlocProvider(
          create: (context) => CurrentSpecificationCubit(),
          child: Container(
            color: const Color(0xFF1a1a1a),
            child: const Column(
              children: [
                Column(
                  children: [HeaderNameCategory(), SpecificationsList()],
                ),
                Gap(10),
                SearchField(),
                Gap(10),
                ListAnimationEntities()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
