
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/view/home/bloc/category_cubit.dart';
import 'package:japanimationbloc/view/home/bloc/spe_cubit.dart';
import 'package:japanimationbloc/view/home/widgets/categories_bar.dart';
import 'package:japanimationbloc/view/home/widgets/thing_list.dart';
import 'package:japanimationbloc/view/home/widgets/spes_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoryCubit()
        ),
        BlocProvider(
          create: (_) => SpeCubit()
        ),
      ],
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Row(
          children: [
            SpesBar(),
            Expanded(
              child: Column(
                children: [
                  CategoriesBar(),
                  ThingsList(),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
