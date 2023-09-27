
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/view/update/bloc/name_cubit.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Paddings.padding24.bot,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(Sizes.size8.size)
      ),
      child: TextField(
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface
        ),
        decoration: InputDecoration(
          label: Text(
            "name",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface
            )
          ),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onChanged: (value) {
          BlocProvider.of<NameCubit>(context).change(value);
        },
      ),
    );
  }
}
