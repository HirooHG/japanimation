
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'homeview.dart';
import 'package:japanimationbloc/modelview/thing/japanbloc.dart';
import 'package:japanimationbloc/modelview/thing/japancubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JapanBloc>(
          create: (_) => JapanBloc(),
        ),
        BlocProvider<ModifyJapanCubit>(
          create: (_) => ModifyJapanCubit(),
        )
      ],
      child: HomeView(),
    );
  }
}