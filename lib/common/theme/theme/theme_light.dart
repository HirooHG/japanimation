
import 'package:flutter/material.dart';
import 'package:japanimationbloc/common/theme/gruvbox/gruvbox_light.dart';

final ThemeData themeLight = ThemeData(
  fontFamily: "Ubuntu",
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: GruvBoxLight.bluel.color,
    onPrimary: GruvBoxLight.foreground_1.color,
    secondary: GruvBoxLight.blueh.color,
    onSecondary: GruvBoxLight.foreground_1.color,
    error: GruvBoxLight.redl.color,
    onError: GruvBoxLight.foreground_2.color,
    background: GruvBoxLight.foreground_0.color,
    onBackground: GruvBoxLight.background_0s.color,
    surface: GruvBoxLight.foreground_0.color,
    onSurface: GruvBoxLight.background_0.color
  ),
  textTheme: const TextTheme(
    // //display
    // displayLarge: ,
    // displayMedium: ,
    // displaySmall: ,
    // // headline
    // headlineLarge: ,
    // headlineMedium: ,
    // headlineSmall: ,
    // // title
    // titleLarge: ,
    // titleMedium: ,
    // titleSmall: ,
    // // label
    // labelLarge: ,
    // labelMedium: ,
    // labelSmall: ,
    // // body
    // bodyLarge: ,
    // bodyMedium: ,
    // bodySmall: 
  )
);
