import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/bottomsheet_cubit.dart';
import 'package:japanimationbloc/view/shared/bottom_sheet/options_list.dart';
import 'package:japanimationbloc/view/shared/bottom_sheet/placeholder_add_entity.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key, required this.tag});

  final String tag;

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  void showBottomSheet() {
    Scaffold.of(context).showBottomSheet((_) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<BottomSheetCubit>(
              create: (_) => BottomSheetCubit(),
            ),
            BlocProvider<MainBloc>.value(
              value: BlocProvider.of<MainBloc>(context),
            ),
          ],
          child: Container(
            color: const Color(0xFF2a2a2a),
            height: 200,
            width: double.infinity,
            child: BlocBuilder<BottomSheetCubit, Options>(
                builder: (context, state) {
              return const Column(
                children: [OptionsList(), Gap(20), PlaceholderAddEntity()],
              );
            }),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: widget.tag,
      elevation: 5.0,
      child: const Icon(Icons.add),
      onPressed: () {
        showBottomSheet();
      },
    );
  }
}
