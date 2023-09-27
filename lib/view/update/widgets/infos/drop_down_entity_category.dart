
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_cat_cubit.dart';

class DropDownEntityCategory extends StatelessWidget {
  const DropDownEntityCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return BlocBuilder<DropDownCatCubit, Category?>(
          builder: (context, cat) {
            return Container(
              margin: Paddings.padding12.vertical,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(Sizes.size8.size)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<Category?>(
                  isExpanded: true,
                  hint: Text(
                    'Select category',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                    ),
                  ),
                  items: (appState is AppLoaded) 
                    ? appState.cats.map((e) => 
                      DropdownMenuItem<Category?>(
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
                  value: cat,
                  onChanged: (value) {
                    BlocProvider.of<DropDownCatCubit>(context).change(value);
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
