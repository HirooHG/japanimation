import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/current_animation_entity_cubit.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';

class HeaderName extends StatelessWidget {
  const HeaderName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAnimationEntityCubit, AnimationEntity>(
        builder: (context, animationEntity) {
      return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          constraints: const BoxConstraints(minHeight: 150),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                animationEntity.name,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Ubuntu"),
              ),
            ),
          ));
    });
  }
}
