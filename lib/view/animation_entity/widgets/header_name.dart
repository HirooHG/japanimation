import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/bloc/main_bloc.dart';
import 'package:japanimationbloc/controller/bloc/state.dart';

class HeaderName extends StatelessWidget {
  const HeaderName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          constraints: const BoxConstraints(minHeight: 150),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                state.currentThing.name,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Ubuntu"),
              ),
            ),
          ));
    });
  }
}
