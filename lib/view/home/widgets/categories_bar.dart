
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/view/home/bloc/category_cubit.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.padding8.right,
      margin: Paddings.padding4.top,
      height: Sizes.size48.size,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, appState) {
          if(appState is AppLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Padding(padding: Paddings.padding8.horizontal);
              },
              scrollDirection: Axis.horizontal,
              itemCount: appState.cats.length,
              itemBuilder: (context, index) {
                final cat = appState.cats[index];

                return BlocBuilder<CategoryCubit, Category?>(
                  builder: (context, category) {
                    return FilterChip(
                      selected: cat == category,
                      label: Text(
                        cat.name
                      ),
                      onSelected: (bool value) {
                        Category? selectedCat = (value) ? cat : null;

                        BlocProvider.of<CategoryCubit>(context).change(selectedCat);

                        BlocProvider.of<AppBloc>(context).add(SelectCategory(cat: selectedCat));
                      }
                    );
                  }
                );
              },
            );
          }

          return Container();
        }
      )
    );
  }
}
