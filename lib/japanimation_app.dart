
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/view/home/home_view.dart';
import 'package:japanimationbloc/modelview/bloc/japan_bloc.dart';
import 'package:japanimationbloc/modelview/cubit/japan_cubit.dart';

class JapanimationApp extends StatelessWidget {
  const JapanimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JapanBloc>(
          create: (_) => JapanBloc()
            ..add(const InitEvent())
        ),
        BlocProvider<ModifyJapanCubit>(
          create: (_) => ModifyJapanCubit(),
        )
      ],
      child: MaterialApp(
        home: HomeView()
      ),
    );
  }
}
