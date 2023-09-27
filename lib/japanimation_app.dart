
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/config/nav/router.dart';
import 'package:japanimationbloc/config/theme/theme/theme_dark.dart';
import 'package:japanimationbloc/config/theme/theme/theme_light.dart';
import 'package:japanimationbloc/data/datasource/data_source.dart';
import 'package:japanimationbloc/domain/repository/get_advs.dart';
import 'package:japanimationbloc/domain/repository/get_categories.dart';
import 'package:japanimationbloc/domain/repository/get_login.dart';
import 'package:japanimationbloc/domain/repository/get_spes.dart';
import 'package:japanimationbloc/domain/usecase/advertisement_usecase.dart';

class JapanimationApp extends StatelessWidget {
  const JapanimationApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppBloc(
            GetAdvertisement(dataSource: DataSource.adv),
            GetCategories(dataSource: DataSource.cat),
            GetSpes(dataSource: DataSource.spe),
            GetLogin(dataSource: DataSource.login),
            AdvertisementUseCase()
          )..add(GetAll())
        )
      ],
      child: AdaptiveTheme(
        light: themeLight,
        dark: themeDark,
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: router,
        )
      )
    );
  }
}
