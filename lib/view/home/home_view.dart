import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/controller/cubit/current_category_cubit.dart';
import 'package:japanimationbloc/controller/cubit/current_specification_cubit.dart';
import 'package:japanimationbloc/controller/cubit/search_cubit.dart';
import 'package:japanimationbloc/view/home/widgets/filtered_list_button.dart';
import 'package:japanimationbloc/view/shared/floating_button.dart';
import 'package:japanimationbloc/view/home/widgets/header_title.dart';
import 'package:japanimationbloc/view/shared/list_animation_entities.dart';
import 'package:japanimationbloc/view/home/widgets/section_categories.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (_) => MainBloc()..add(const GetAll()),
        ),
        BlocProvider<CurrentCategoryCubit>(
          create: (_) => CurrentCategoryCubit(),
        ),
        BlocProvider<CurrentSpecificationCubit>(
          create: (_) => CurrentSpecificationCubit(),
        ),
        BlocProvider<SearchCubit>(
          create: (_) => SearchCubit(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: const FloatingButton(
            tag: "home_view",
          ),
          body: SafeArea(
            child: Container(
              color: const Color(0xFF1a1a1a),
              child: const Column(
                children: [
                  HeaderTitle(),
                  SectionCategories(),
                  FilteredListButton(),
                  ListAnimationEntities()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
