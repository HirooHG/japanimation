import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/model/entities/specification.dart';

class CurrentSpecificationCubit extends Cubit<Specification?> {
  CurrentSpecificationCubit() : super(null);

  void set(Specification? spe) {
    emit(spe);
  }

  List<AnimationEntity> filterAnimations(List<AnimationEntity> animations) {
    if (state == null) {
      return animations;
    }

    return animations
        .where((element) => element.specification == state?.id)
        .toList();
  }
}
