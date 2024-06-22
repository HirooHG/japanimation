import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';

class CurrentAnimationEntityCubit extends Cubit<AnimationEntity> {
  CurrentAnimationEntityCubit(AnimationEntity entity) : super(entity);

  void set(AnimationEntity animationEntity, {Function? callback}) {
    emit(animationEntity);

    callback?.call();
  }

  void setCategory(int? category) {
    state.category = category;
    emit(state);
  }

  void setEpisode(int? episode) {
    state.episode = episode;
    emit(state);
  }

  void setChapter(int? chapter) {
    state.chapter = chapter;
    emit(state);
  }

  void setTome(int? tome) {
    state.tome = tome;
    emit(state);
  }

  void setSearson(int? season) {
    state.season = season;
    emit(state);
  }

  void setSpecification(int? specification) {
    state.specification = specification;
    emit(state);
  }
}
