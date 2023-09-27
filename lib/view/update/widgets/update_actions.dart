
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/snack_bar/custom_snack_bar.dart';
import 'package:japanimationbloc/view/update/bloc/chips_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/name_cubit.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_cat_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_spe_cubit.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/view/update/bloc/update_options_cubit.dart';
import 'package:uuid/uuid.dart';

class UpdateActions {
  const UpdateActions({
    required this.context
  });

  final BuildContext context;

  void handleUpdate() {
    final String name = BlocProvider.of<NameCubit>(context).state;
    final UpdateOptions opt = BlocProvider.of<UpdateOptionsCubit>(context).state;
    final TypeOptions type = BlocProvider.of<ChipsCubit>(context).state;

    if(name.isEmpty && opt != UpdateOptions.delete) {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar.error(content: "Name is empty")
          .buildSnackBar(context)
      );
      return;
    }

    switch (type) {
      case TypeOptions.advertisement:
        _handleUpdateAdv(name);
        break;
      case TypeOptions.category:
        _handleUpdateCat(name);
        break;
      default:
        _handleUpdateSpe(name);
    }
  }

  void _handleUpdateSpe(String name) {
    final UpdateOptions opt = BlocProvider.of<UpdateOptionsCubit>(context).state;
    switch(opt) {
      case UpdateOptions.add:
        final spe = Spe(
          id: const Uuid().v1(),
          name: name
        );

        BlocProvider.of<AppBloc>(context).add(AddEntity(entity: spe));
        return;
      case UpdateOptions.modify:
        final Spe? spe = BlocProvider.of<DropDownSpeCubit>(context).state;
        if(spe != null) {
          final speNew = Spe(
            id: spe.id,
            name: name
          );
          BlocProvider.of<AppBloc>(context).add(ModifyEntity(entity: speNew));
          return;
        }
        break;
      default:
        final Spe? spe = BlocProvider.of<DropDownSpeCubit>(context).state;
        if(spe != null) {
          BlocProvider.of<AppBloc>(context).add(DeleteEntity(entity: spe));
          return;
        }
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const CustomSnackBar.error(content: "Select a spe")
        .buildSnackBar(context)
    );
  }

  void _handleUpdateCat(String name) {
    final UpdateOptions opt = BlocProvider.of<UpdateOptionsCubit>(context).state;
    switch(opt) {
      case UpdateOptions.add:
        final cat = Category(
          id: const Uuid().v1(),
          name: name
        );

        BlocProvider.of<AppBloc>(context).add(AddEntity(entity: cat));
        return;
      case UpdateOptions.modify:
        final Category? cat = BlocProvider.of<DropDownCatCubit>(context).state;
        if(cat != null) {
          final catNew = Category(
            id: cat.id,
            name: name
          );
          BlocProvider.of<AppBloc>(context).add(ModifyEntity(entity: catNew));
          return;
        }
        break;
      default:
        final Category? cat = BlocProvider.of<DropDownCatCubit>(context).state;
        if(cat != null) {
          BlocProvider.of<AppBloc>(context).add(DeleteEntity(entity: cat));
          return;
        }
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const CustomSnackBar.error(content: "Select a category")
        .buildSnackBar(context)
    );
  }

  void _handleUpdateAdv(String name) {
    final Category? cat = BlocProvider.of<DropDownCatCubit>(context).state;
    final Spe? spe = BlocProvider.of<DropDownSpeCubit>(context).state;
    final adv = Advertisement(
      id: const Uuid().v1(),
      name: name,
      category: cat,
      spe: spe
    );

    BlocProvider.of<AppBloc>(context).add(AddEntity(entity: adv));
  }
}
