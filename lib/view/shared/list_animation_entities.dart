import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';
import 'package:japanimationbloc/controller/cubit/current_category_cubit.dart';
import 'package:japanimationbloc/controller/cubit/current_specification_cubit.dart';
import 'package:japanimationbloc/controller/cubit/search_cubit.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/view/animation_entity/animation_entity_view.dart';
import 'package:japanimationbloc/view/error/error_view.dart';
import 'package:japanimationbloc/view/shared/custom_shimmer.dart';
import 'package:japanimationbloc/view/shared/empty_list.dart';

class ListAnimationEntities extends StatelessWidget {
  const ListAnimationEntities({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          if (state is! MainLoaded) {
            if (state is MainLoading) {
              return const CustomShimmer(
                  height: double.infinity, width: double.infinity);
            }

            return const ErrorView();
          }

          if (state.animationEntities.isEmpty) {
            return const EmptyList.big(option: Options.animation);
          }

          return BlocBuilder<CurrentCategoryCubit, Category?>(
              builder: (context, _) {
            return BlocBuilder<CurrentSpecificationCubit, Specification?>(
                builder: (context, _) {
              return BlocBuilder<SearchCubit, String>(
                  builder: (context, search) {
                List<AnimationEntity> animations = state.animationEntities;
                animations = BlocProvider.of<CurrentSpecificationCubit>(context)
                    .filterAnimations(animations);
                animations = BlocProvider.of<CurrentCategoryCubit>(context)
                    .filterAnimations(animations);
                animations = BlocProvider.of<SearchCubit>(context)
                    .filterAnimations(animations);
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: animations.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                    ),
                    itemBuilder: (context, index) {
                      AnimationEntity animationEntity = animations[index];
                      return Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider.value(
                                            value: BlocProvider.of<MainBloc>(
                                                context),
                                          ),
                                        ],
                                        child: AnimationEntityView(
                                            animationEntity: animationEntity),
                                      ),
                                    ));
                              },
                              child: Text(animationEntity.name,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42d392)))));
                    });
              });
            });
          });
        }),
      ),
    );
  }
}
