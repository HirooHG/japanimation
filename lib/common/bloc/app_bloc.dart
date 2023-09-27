
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:japanimationbloc/api/api_exceptions.dart';
import 'package:japanimationbloc/common/secure_storage/secure_storage.dart';
import 'package:japanimationbloc/common/snack_bar/custom_snack_bar.dart';
import 'package:japanimationbloc/config/nav/context_keys.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/domain/entities/base_entity.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/domain/repository/get_advs.dart';
import 'package:japanimationbloc/domain/repository/get_categories.dart';
import 'package:japanimationbloc/domain/repository/get_login.dart';
import 'package:japanimationbloc/domain/repository/get_spes.dart';

import 'package:equatable/equatable.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:japanimationbloc/domain/usecase/advertisement_usecase.dart';

part 'app_events.dart';
part 'app_states.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  final GetSpes _getSpes;
  final GetCategories _getCategories;
  final GetAdvertisement _getAdvertisement;
  final GetLogin _login;

  final AdvertisementUseCase _advertisementUseCase;

  AppBloc(
    this._getAdvertisement,
    this._getCategories,
    this._getSpes,
    this._login,
    this._advertisementUseCase
  ) : super(AppLoading()) {
    on<GetAll>(_getAll);

    on<SelectSpe>(_selectSpe);

    on<SelectCategory>(_selectCategory);

    on<AddEntity>(_addEntity);

    on<DeleteEntity>(_deleteEntity);

    on<ModifyEntity>(_modifyEntity);

    on<ReleadAll>(_reloadAll);
  }

  void _reloadAll(ReleadAll event, Emitter<AppState> emit) {
    emit(
      AppLoaded(
        spes: (state as AppLoaded).spes,
        advs: (state as AppLoaded).advs,
        cats: (state as AppLoaded).cats
      )
    );
  }

  void _modifyEntity(ModifyEntity event, Emitter<AppState> emit) async {
    try {
      final appState = state as AppLoaded;

      final advs = appState.advs;
      final spes = appState.spes;
      final cats = appState.cats;

      switch(event.entity.runtimeType) {
        case Advertisement:
          final adv = event.entity as Advertisement;
          final bool res = await _getAdvertisement.putAdv(adv);
          if(res) {
            advs.removeWhere((e) => e == adv);
            advs.add(adv);
            snackBarNotice("Advertisement modified");
          }
          break;
        case Category:
          final cat = event.entity as Category;
          final bool res = await _getCategories.putCat(cat);
          if(res) {
            cats.removeWhere((e) => e == cat);
            cats.add(cat);
            snackBarNotice("Category modified");
          }
          break;
        default:
          final spe = event.entity as Spe;
          final bool res = await _getSpes.putSpe(spe);
          if(res) {
            spes.removeWhere((e) => e == spe);
            snackBarNotice("Spe modified");
          }
      }

      emit(AppLoaded(
        spes: spes,
        advs: advs,
        cats: cats
      ));
    } catch(e, s) {
      if(e is ApiException && e.statusCode == HttpStatus.forbidden) {
        final appState = await _handleApiException();
        if(appState is AppLoaded) {
          emit(appState);
          return;
        }
      } else if(e is ApiException && e.statusCode == HttpStatus.badRequest) {

        snackBarError("Ups, there's something wrong, maybe the name ?");
      }
      log(e.toString(), stackTrace: s);

      snackBarError("Nope, no connection bro");
    }
  }

  void _deleteEntity(DeleteEntity event, Emitter<AppState> emit) async {
    try {
      final appState = state as AppLoaded;

      final advs = appState.advs;
      final spes = appState.spes;
      final cats = appState.cats;

      emit(AppLoading());

      switch(event.entity.runtimeType) {
        case Advertisement:
          final adv = event.entity as Advertisement;
          final bool res = await _getAdvertisement.deleteAdv(adv);
          if(res) {
            advs.removeWhere((e) => e.id == adv.id);
            snackBarNotice("Advertisement deleted");
          }
          break;
        case Category:
          final cat = event.entity as Category;
          final bool res = await _getCategories.deleteCat(cat);
          if(res) {
            cats.removeWhere((e) => cat.id == e.id);
            snackBarNotice("Category deleted");
          }
          break;
        default:
          final spe = event.entity as Spe;
          final bool res = await _getSpes.deleteSpe(spe);
          if(res) {
            spes.removeWhere((e) => e.id == spe.id);
            snackBarNotice("Spe deleted");
          }
      }

      emit(AppLoaded(
        spes: spes,
        advs: advs,
        cats: cats
      ));
    } catch(e, s) {
      if(e is ApiException && e.statusCode == HttpStatus.forbidden) {
        final appState = await _handleApiException();
        if(appState is AppLoaded) {
          emit(appState);
          return;
        }
      } else if(e is ApiException && e.statusCode == HttpStatus.badRequest) {

        snackBarError("Ups, there's something wrong, maybe the name ?");
      }
      log(e.toString(), stackTrace: s);

      snackBarError("Nope, no connection bro");
    }
  }

  void _addEntity(AddEntity event, Emitter<AppState> emit) async {
    try {
      final appState = state as AppLoaded;

      final advs = appState.advs;
      final spes = appState.spes;
      final cats = appState.cats;

      switch(event.entity.runtimeType) {
        case Advertisement:
          final adv = event.entity as Advertisement;
          final bool res = await _getAdvertisement.postAdv(adv);
          if(res) {
            advs.add(adv);
            snackBarNotice("Advertisement added");
          }
          break;
        case Category:
          final cat = event.entity as Category;
          final bool res = await _getCategories.postCat(cat);
          if(res) {
            cats.add(cat);
            snackBarNotice("Category added");
          }
          break;
        default:
          final spe = event.entity as Spe;
          final bool res = await _getSpes.postSpe(spe);
          if(res) {
            spes.add(spe);
            snackBarNotice("Spe added");
          }
      }

      emit(AppLoaded(
        spes: spes,
        advs: advs,
        cats: cats
      ));
    } catch(e, s) {
      if(e is ApiException && e.statusCode == HttpStatus.forbidden) {
        final appState = await _handleApiException();
        if(appState is AppLoaded) {
          emit(appState);
          return;
        }
      } else if(e is ApiException && e.statusCode == HttpStatus.badRequest) {

        snackBarError("Ups, there's something wrong, maybe the name ?");
      }
      log(e.toString(), stackTrace: s);

      snackBarError("Nope, no connection bro");
    }
  }

  void _selectSpe(SelectSpe event, Emitter<AppState> emit) async {
    try {
      final appLoaded = state as AppLoaded;
      final spes = appLoaded.spes;
      final cats = appLoaded.cats;

      List<Advertisement> advs = await _getAdvertisement.getAdvs();
      advs = _advertisementUseCase.filterAdvertisementBySpe(
        advs,
        event.spe
      );

      final AppLoaded appState = AppLoaded(
        spes: spes,
        advs: advs,
        cats: cats,
      );

      emit(appState);
    } catch(e, s) {
      if(e is ApiException && e.statusCode == HttpStatus.forbidden) {
        final appState = await _handleApiException();
        if(appState is AppLoaded) {
          emit(appState);
          return;
        }
      }
      log(e.toString(), stackTrace: s);

      snackBarError("Nope, no connection bro");
    }
  }

  void _selectCategory(SelectCategory event, Emitter<AppState> emit) async {
    try {
      final appLoaded = state as AppLoaded;

      final spes = appLoaded.spes;
      final cats = appLoaded.cats;

      List<Advertisement> advs = await _getAdvertisement.getAdvs();
      advs = _advertisementUseCase.filterAdvertisementByCat(
        advs,
        event.cat
      );

      final AppLoaded appState = AppLoaded(
        spes: spes,
        advs: advs,
        cats: cats,
      );
      emit(appState);

    } catch(e, s) {
      if(e is ApiException && e.statusCode == HttpStatus.forbidden) {
        final appState = await _handleApiException();
        if(appState is AppLoaded) {
          emit(appState);
          return;
        }
      }

      log(e.toString(), stackTrace: s);

      snackBarError("Nope, no connection bro");
    }
  }

  void _getAll(GetAll event, Emitter<AppState> emit) async {
    try {
      final advs = await _getAdvertisement.getAdvs();
      final spes = await _getSpes.getSpes();
      final cats = await _getCategories.getCategories();

      emit(AppLoaded(
        spes: spes,
        advs: advs,
        cats: cats
      ));

    } catch(e, s) {
      if(e is ApiException && e.statusCode == HttpStatus.forbidden) {
        final appState = await _handleApiException();
        if(appState is AppLoaded) {
          emit(appState);
          return;
        }
      }

      log(e.toString(), stackTrace: s);

      snackBarError("Nope, no connection bro");
    }
  }

  Future<AppState> _handleApiException() async {
    final token = await _login.login();
    await SecureStorage().setToken(token);

    final advs = await _getAdvertisement.getAdvs();
    final spes = await _getSpes.getSpes();
    final cats = await _getCategories.getCategories();

    return AppLoaded(
      spes: spes,
      advs: advs,
      cats: cats
    );
  }

  void snackBarNotice(String message) {
    BuildContext ctx = rootNavigatorKey.currentContext!;
    if(ctx.mounted) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        CustomSnackBar.notice(content: message)
          .buildSnackBar(ctx)
      );
    }
  }
  
  void snackBarError(String message) {
    BuildContext ctx = rootNavigatorKey.currentContext!;
    if(ctx.mounted) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        CustomSnackBar.error(content: message)
          .buildSnackBar(ctx)
      );
    }
  }

  @override
  void onTransition(Transition<AppEvent, AppState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    if(state is AppLoaded) {
      return state.toJson();
    }
    return null;
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppLoaded.fromJson(json);
  }
}

