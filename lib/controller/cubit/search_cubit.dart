import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit() : super('');

  void set(String value) {
    emit(value);
  }

  List<AnimationEntity> filterAnimations(List<AnimationEntity> animations) {
    if (state.isEmpty) {
      return animations;
    }

    return animations
        .where((element) => element.name.toLowerCase().contains(state))
        .toList();
  }
}
