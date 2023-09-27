
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/view/update/bloc/update_options_cubit.dart';

class UpdateOptionsChips extends StatelessWidget {
  const UpdateOptionsChips({
    super.key,
    required this.opt
  });

  final UpdateOptions opt;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateOptionsCubit, UpdateOptions>(
      builder: (context, selectedType) {
        final bool isSelected = opt == selectedType;
        final isLast = UpdateOptions.values.last == opt;
        final isFirst = UpdateOptions.values.first == opt;

        final Color color;

        switch(opt) {
          case UpdateOptions.add:
            color = Theme.of(context).colorScheme.secondary;
            break;
          case UpdateOptions.modify:
            color = Theme.of(context).colorScheme.primary;
            break;
          default:
            color = Theme.of(context).colorScheme.error;
            break;
        }

        return Expanded(
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<UpdateOptionsCubit>(context).change(opt);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: isLast
                  ? BorderRadius.only(
                    topRight: Radius.circular(Sizes.size4.size),
                    bottomRight: Radius.circular(Sizes.size4.size)
                  )
                  : isFirst
                    ? BorderRadius.only(
                      topLeft: Radius.circular(Sizes.size4.size),
                      bottomLeft: Radius.circular(Sizes.size4.size)
                    )
                    : null,
                color: isSelected
                  ? color
                  : Theme.of(context).colorScheme.onBackground
              ),
              child: Center(
                child: Text(
                  opt.name.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.background
                    )
                ),
              ),
            )
          )
        );
      }
    );
  }
}
