import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/current_category_cubit.dart';
import 'package:japanimationbloc/model/entities/category.dart';

class HeaderNameCategory extends StatelessWidget {
  const HeaderNameCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentCategoryCubit, Category?>(
        builder: (context, currentCategory) {
      return SizedBox(
        height: 150,
        child: Center(
            child: Text(
          currentCategory != null ? currentCategory.name : "All",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: "Ubuntu"),
        )),
      );
    });
  }
}
