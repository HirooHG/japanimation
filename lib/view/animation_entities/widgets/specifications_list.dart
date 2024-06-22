import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';
import 'package:japanimationbloc/controller/cubit/current_specification_cubit.dart';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/view/shared/custom_shimmer.dart';
import 'package:japanimationbloc/view/shared/empty_list.dart';

class SpecificationsList extends StatelessWidget {
  const SpecificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is! MainLoaded) {
          return const CustomShimmer(height: 50, width: double.infinity);
        }

        if (state.spes.isEmpty) {
          return const SizedBox(
              height: 50,
              child: EmptyList.small(option: Options.specification));
        }

        return BlocBuilder<CurrentSpecificationCubit, Specification?>(
            builder: (context, currentSpe) {
          return SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.spes.length,
                  itemBuilder: (context, index) {
                    Specification spe = state.spes[index];
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        child: Center(
                          child: ChoiceChip(
                              label: Text(spe.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu")),
                              onSelected: (selected) {
                                final nextSpe = selected ? spe : null;
                                BlocProvider.of<CurrentSpecificationCubit>(
                                        context)
                                    .set(nextSpe);
                              },
                              selectedColor: const Color(0xFF42d392),
                              selected: currentSpe == spe),
                        ));
                  }));
        });
      }),
    );
  }
}
