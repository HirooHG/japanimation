
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/view/update/bloc/chips_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/update_options_cubit.dart';
import 'package:japanimationbloc/view/update/widgets/update_actions.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UpdateActions(context: context).handleUpdate();
      },
      child: BlocBuilder<ChipsCubit, TypeOptions>(
        builder: (context, type) {
          return BlocBuilder<UpdateOptionsCubit, UpdateOptions>(
            builder: (context, optTemp) {
              final opt = (type == TypeOptions.advertisement)
                ? UpdateOptions.add
                : optTemp;
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

              return Container(
                height: Sizes.size64.size,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(Sizes.size8.size)
                ),
                child: Center(
                  child: Text(
                    opt.name.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                    )
                  ),
                ),
              );
            }
          );
        }
      )
    );
  }
}
