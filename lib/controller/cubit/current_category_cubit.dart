import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/model/entities/category.dart';

class CurrentCategoryCubit extends Cubit<Category?> {
  CurrentCategoryCubit() : super(null);

  void set(Category? category) {
    emit(category);
  }

  List<AnimationEntity> filterAnimations(List<AnimationEntity> animations) {
    if (state == null) {
      return animations;
    }

    return animations
        .where((element) => element.category == state?.id)
        .toList();
  }
}
