import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:japanimationbloc/controller/cubit/current_animation_entity_cubit.dart';
import 'package:japanimationbloc/controller/cubit/current_specification_cubit.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/view/animation_entity/widgets/form_fields.dart';

import 'package:japanimationbloc/view/animation_entity/widgets/general_infos.dart';
import 'package:japanimationbloc/view/animation_entity/widgets/header_name.dart';
import 'package:japanimationbloc/view/animation_entity/widgets/update_buttons.dart';

class AnimationEntityView extends StatelessWidget {
  const AnimationEntityView({super.key, required this.animationEntity});

  final AnimationEntity animationEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<CurrentAnimationEntityCubit>(
              create: (context) => CurrentAnimationEntityCubit(animationEntity),
            ),
            BlocProvider<CurrentSpecificationCubit>(
              create: (context) => CurrentSpecificationCubit(),
            ),
          ],
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xFF1a1a1a),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderName(),
                  Gap(10),
                  GeneralInfos(),
                  Gap(30),
                  FormFields(),
                  UpdateButtons()
                ],
              )),
        ),
      ),
    );
  }
}
