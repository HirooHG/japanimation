import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/bottomsheet_cubit.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/view/animation_entity/animation_entity_view.dart';

class PlaceholderAddEntity extends StatefulWidget {
  const PlaceholderAddEntity({super.key});

  @override
  State<PlaceholderAddEntity> createState() => _PlaceholderAddEntityState();
}

class _PlaceholderAddEntityState extends State<PlaceholderAddEntity> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, Options>(builder: (context, state) {
      return SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    cursorColor: const Color(0xFF42d392),
                    style: const TextStyle(
                        color: Color(0xFF42d392), fontFamily: "Ubuntu"),
                    controller: controller,
                    decoration: InputDecoration(
                        labelText: "new ${state.name}",
                        labelStyle: const TextStyle(
                            color: Color(0xFF42d392), fontFamily: "Ubuntu"),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF42d392))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF42d392)))),
                  )),
              const Gap(20),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF5f8bee),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          BlocProvider.of<MainBloc>(context).add(AddEntity(
                            name: controller.text,
                            option: state,
                            onComplete: _onComplete,
                            onError: _onError,
                          ));
                        }
                      },
                      child: const Text("Add",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Ubuntu")))),
            ],
          ));
    });
  }

  void _onComplete(AnimationEntity? entity) {
    Navigator.pop(context);
    if (entity != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<MainBloc>(context),
                  child: AnimationEntityView(animationEntity: entity))));
    }
  }

  void _onError(Options options) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Failed to add")));
    Navigator.pop(context);
  }
}
