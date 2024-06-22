import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/controller/cubit/current_animation_entity_cubit.dart';
import 'package:japanimationbloc/controller/utils/extensions/list.ext.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/view/shared/custom_shimmer.dart';

class GeneralInfos extends StatelessWidget {
  const GeneralInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAnimationEntityCubit, AnimationEntity>(
        builder: (context, animationEntity) {
      return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is! MainLoaded) {
          return const CustomShimmer(height: 200, width: double.infinity);
        }

        final categories = [...state.categories];
        final spes = [...state.spes];
        _handleNullCategory(categories);
        _handleNullSpecification(spes);

        return BlocBuilder<CurrentAnimationEntityCubit, AnimationEntity>(
            builder: (context, animationEntity) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Infos :",
                style: TextStyle(
                    fontFamily: "Ubuntu", color: Colors.white, fontSize: 20),
              ),
              const Gap(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: const Color(0xFF42d392),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButton<Category>(
                  borderRadius: BorderRadius.circular(8),
                  underline: Container(),
                  icon: Container(),
                  dropdownColor: const Color(0xFF42d392),
                  hint: const Text('No category',
                      style: TextStyle(
                          fontFamily: "Ubuntu", fontWeight: FontWeight.bold)),
                  onChanged: (value) {
                    final id = value != null && value.identifier.isEmpty
                        ? null
                        : value?.id;

                    BlocProvider.of<CurrentAnimationEntityCubit>(context)
                        .setCategory(id);
                  },
                  value: categories.singleOrNullWhere(
                      (element) => element.id == animationEntity.category),
                  items: categories.map((e) {
                    return DropdownMenuItem<Category>(
                      key: Key("key${e.name}"),
                      value: e,
                      child: Text(
                        e.name,
                        style: const TextStyle(
                            fontFamily: "Ubuntu", fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Gap(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: const Color(0xFF42d392),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButton<Specification>(
                  borderRadius: BorderRadius.circular(8),
                  underline: Container(),
                  icon: Container(),
                  dropdownColor: const Color(0xFF42d392),
                  hint: const Text('No specification',
                      style: TextStyle(
                          fontFamily: "Ubuntu", fontWeight: FontWeight.bold)),
                  onChanged: (value) {
                    final id = value != null && value.identifier.isEmpty
                        ? null
                        : value?.id;

                    BlocProvider.of<CurrentAnimationEntityCubit>(context)
                        .setSpecification(id);
                  },
                  value: spes.singleOrNullWhere(
                      (element) => element.id == animationEntity.specification),
                  items: spes.map((e) {
                    return DropdownMenuItem<Specification>(
                      key: Key("key${e.name}"),
                      value: e,
                      child: Text(
                        e.name,
                        style: const TextStyle(
                            fontFamily: "Ubuntu", fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        });
      });
    });
  }

  _handleNullCategory(List<Category> categories) {
    if (!categories.any((e) => e.name == "No category")) {
      categories.insert(0, const Category(identifier: '', name: "No category"));
    }
  }

  _handleNullSpecification(List<Specification> spes) {
    if (!spes.any((e) => e.name == "No specification")) {
      spes.insert(
          0, const Specification(identifier: '', name: "No specification"));
    }
  }
}
