
import 'package:flutter/material.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/view/update/bloc/chips_cubit.dart';

class Chips extends StatelessWidget {
  const Chips({
    super.key,
    required this.opt,
  });

  final TypeOptions opt;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChipsCubit, TypeOptions>(
      builder: (context, selectedType) {
        final bool isSelected = opt == selectedType;

        return GestureDetector(
          onTap: () {
            BlocProvider.of<ChipsCubit>(context).change(opt);
          },
          child: Container(
            padding: Paddings.padding12.all,
            decoration: BoxDecoration(
              color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(Sizes.size256.size)
            ),
            child: Text(
              opt.name,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: isSelected
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(context).colorScheme.surface,
              )
            ),
          )
        );
      }
    );
  }
}
