
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_spe_cubit.dart';

class DropDownEntitySpe extends StatelessWidget {
  const DropDownEntitySpe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return BlocBuilder<DropDownSpeCubit, Spe?>(
          builder: (context, spe) {
            return Container(
              margin: Paddings.padding12.vertical,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(Sizes.size8.size)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<Spe?>(
                  isExpanded: true,
                  hint: Text(
                    'Select spe',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                    ),
                  ),
                  items: (appState is AppLoaded) 
                    ? appState.spes.map((e) => 
                      DropdownMenuItem<Spe?>(
                        value: e,
                        child: Text(
                          e.name,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface
                          ),
                        ),
                      )
                    ).toList()
                  : [],
                  value: spe,
                  onChanged: (value) {
                    BlocProvider.of<DropDownSpeCubit>(context).change(value);
                  },
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: Sizes.size256.size,
                  ),
                )
              ),
            );
          }
        );
      }
    );
  }
}
