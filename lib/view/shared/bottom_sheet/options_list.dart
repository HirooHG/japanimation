import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/bottomsheet_cubit.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, Options>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Options.values.map((option) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChoiceChip(
                  label: Text(option.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "Ubuntu")),
                  selectedColor: const Color(0xFF42d392),
                  selected: state == option,
                  onSelected: (selected) => {
                    if (selected)
                      BlocProvider.of<BottomSheetCubit>(context).change(option)
                  },
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
