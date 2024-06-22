import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';
import 'package:japanimationbloc/controller/cubit/current_category_cubit.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/view/shared/custom_shimmer.dart';
import 'package:japanimationbloc/view/shared/empty_list.dart';

class SectionCategories extends StatelessWidget {
  const SectionCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is! MainLoaded) {
          return const CustomShimmer(height: 50, width: double.infinity);
        }

        List<Category> categories = state.categories;
        return SizedBox(
            height: 75,
            child: BlocBuilder<CurrentCategoryCubit, Category?>(
                builder: (context, currentCategory) {
              if (categories.isEmpty) {
                return const EmptyList.small(option: Options.category);
              }

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    Category category = categories[index];
                    return SizedBox(
                        height: 200,
                        child: Center(
                          child: ChoiceChip(
                            label: Text(category.name,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ubuntu")),
                            onSelected: (selected) {
                              final nextCategory =
                                  currentCategory == category ? null : category;
                              BlocProvider.of<CurrentCategoryCubit>(context)
                                  .set(nextCategory);
                            },
                            selectedColor: const Color(0xFF42d392),
                            selected: currentCategory == category,
                          ),
                        ));
                  });
            }));
      }),
    );
  }
}
