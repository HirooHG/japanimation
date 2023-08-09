
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/theme/theme/theme_dark.dart';
import 'package:japanimationbloc/common/theme/theme/theme_light.dart';
import 'package:japanimationbloc/common/nav/router.dart';

class JapanimationApp extends StatelessWidget {
  const JapanimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
      ],
      child: MaterialApp.router(
        themeMode: ThemeMode.light,
        theme: themeLight,
        darkTheme: themeDark,
        routerConfig: router,
      )
    );
  }
}
