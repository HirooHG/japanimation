import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:japanimationbloc/controller/bloc/bloc.dart';
import 'package:japanimationbloc/controller/cubit/current_animation_entity_cubit.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';

class UpdateButtons extends StatefulWidget {
  const UpdateButtons({super.key});

  @override
  State<UpdateButtons> createState() => _UpdateButtonsState();
}

class _UpdateButtonsState extends State<UpdateButtons> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAnimationEntityCubit, AnimationEntity>(
        builder: (context, state) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<MainBloc>(context).add(UpdateEntity(
                  entity: state,
                  onComplete: _onUpdate,
                  onError: _onErrorUpdate));
            },
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFF42d392))),
            child: const Text("Update", style: TextStyle(color: Colors.black)),
          ),
        ),
        const Gap(20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<MainBloc>(context).add(RemoveEntity(
                  entity: state,
                  onComplete: _onDelete,
                  onError: _onErrorDelete));
            },
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red)),
            child: const Text("Delete", style: TextStyle(color: Colors.black)),
          ),
        ),
      ]);
    });
  }

  void _onDelete() {
    // snack bar to confirm delete
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Animation deleted !'),
      ),
    );
  }

  void _onUpdate() {
    // snack bar to confirm update
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Animation updated !'),
      ),
    );
  }

  void _onErrorUpdate() {
    // snack bar to confirm update
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error updating animation !'),
      ),
    );
  }

  void _onErrorDelete() {
    // snack bar to confirm update
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error deleting animation !'),
      ),
    );
  }
}
