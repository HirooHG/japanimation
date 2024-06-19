import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';

class HeaderNameCategory extends StatelessWidget {
  const HeaderNameCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return SizedBox(
        height: 150,
        child: Center(
            child: Text(
          (state.currentCategory.name == '')
              ? "All"
              : state.currentCategory.name,
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
