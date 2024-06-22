import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/current_animation_entity_cubit.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'package:japanimationbloc/view/animation_entity/widgets/field.dart';

class FormFields extends StatefulWidget {
  const FormFields({super.key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final TextEditingController epController = TextEditingController();
  final TextEditingController chapterController = TextEditingController();
  final TextEditingController tomeController = TextEditingController();
  final TextEditingController seasonController = TextEditingController();

  @override
  void dispose() {
    epController.dispose();
    chapterController.dispose();
    tomeController.dispose();
    seasonController.dispose();
    super.dispose();
  }

  void initControllers(AnimationEntity animationEntity) {
    if (animationEntity.season != null) {
      seasonController.text = animationEntity.season.toString();
    }
    if (animationEntity.chapter != null) {
      chapterController.text = animationEntity.chapter.toString();
    }
    if (animationEntity.tome != null) {
      tomeController.text = animationEntity.tome.toString();
    }
    if (animationEntity.episode != null) {
      epController.text = animationEntity.episode.toString();
    }
    epController.addListener(onEpisodeChanged);
    chapterController.addListener(onChapterChanged);
    tomeController.addListener(onTomeChanged);
    seasonController.addListener(onSeasonChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<CurrentAnimationEntityCubit, AnimationEntity>(
            builder: (context, animationEntity) {
          initControllers(animationEntity);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Field(controller: epController, text: "Episode"),
              Field(controller: chapterController, text: "Chapter"),
              Field(controller: tomeController, text: "Tome"),
              Field(controller: seasonController, text: "Season"),
            ],
          );
        }),
      ),
    );
  }

  onEpisodeChanged() {
    final episode = int.tryParse(epController.text);
    if (episode != null) {
      context.read<CurrentAnimationEntityCubit>().setEpisode(episode);
    }
  }

  onChapterChanged() {
    final chapter = int.tryParse(chapterController.text);
    if (chapter != null) {
      context.read<CurrentAnimationEntityCubit>().setChapter(chapter);
    }
  }

  onTomeChanged() {
    final tome = int.tryParse(tomeController.text);
    if (tome != null) {
      context.read<CurrentAnimationEntityCubit>().setTome(tome);
    }
  }

  onSeasonChanged() {
    final season = int.tryParse(seasonController.text);
    if (season != null) {
      context.read<CurrentAnimationEntityCubit>().setSearson(season);
    }
  }
}
