import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';
import 'package:japanimationbloc/model/entities/specification.dart';

class SpecificationsList extends StatelessWidget {
  const SpecificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
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
                            if (state.currentSpeciality == spe) {
                            } else {}
                          },
                          selectedColor: const Color(0xFF42d392),
                          selected: state.currentSpeciality == spe),
                    ));
              }));
    });
  }
}
