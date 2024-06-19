import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/event.dart';

import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/model/db/database_handler.dart';
import 'package:japanimationbloc/controller/cubit/japancubit.dart';
import 'package:japanimationbloc/view/home/widgets/filtered_list_button.dart';
import 'package:japanimationbloc/view/home/widgets/floating_button.dart';
import 'package:japanimationbloc/view/home/widgets/header_title.dart';
import 'package:japanimationbloc/view/home/widgets/list_objects.dart';
import 'package:japanimationbloc/view/home/widgets/section_categories.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final handler = const DatabaseHandler();
  final MainBloc mainBloc = MainBloc();
  final ModifyJapanCubit modifyJapanCubit = ModifyJapanCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (_) => mainBloc..add(const InitEvent()),
        ),
        BlocProvider<ModifyJapanCubit>(
          create: (_) => modifyJapanCubit,
        )
      ],
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: MultiBlocProvider(providers: [
            BlocProvider.value(value: modifyJapanCubit),
            BlocProvider.value(value: mainBloc)
          ], child: const FloatingButtons(tag: "homeview")),
          body: SafeArea(
            child: Container(
              color: const Color(0xFF1a1a1a),
              child: const Column(
                children: [
                  HeaderTitle(),
                  SectionCategories(),
                  FilteredListButton(),
                  ListObjects()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
