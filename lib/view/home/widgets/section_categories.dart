import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/entities/category.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';

class SectionCategories extends StatelessWidget {
  const SectionCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      List<Category> categories = state.categories;
      return SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                Category category = categories[index];
                return Container(
                    height: 200,
                    child: Center(
                      child: ChoiceChip(
                        label: Text(category.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Ubuntu")),
                        onSelected: (selected) {
                          if (state.currentCategory == category) {
                            BlocProvider.of<MainBloc>(context).add(
                                SelectCategoryEvent(
                                    category: Category.empty()));
                          } else {
                            BlocProvider.of<MainBloc>(context)
                                .add(SelectCategoryEvent(category: category));
                          }
                        },
                        selectedColor: const Color(0xFF42d392),
                        selected: state.currentCategory == category,
                      ),
                    ));
              }));
    });
  }
}
