
import 'package:flutter/material.dart';
import 'package:japanimationbloc/config/theme/gruvbox/gruvbox_light.dart';

final ThemeData themeLight = ThemeData(
  fontFamily: "Ubuntu",
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: GruvBoxLight.yellowl.color,
    onPrimary: GruvBoxLight.foreground_0.color,
    secondary: GruvBoxLight.greenl.color,
    onSecondary: GruvBoxLight.foreground_0.color,
    error: GruvBoxLight.redl.color,
    onError: GruvBoxLight.foreground_0.color,
    background: GruvBoxLight.background_0h.color,
    onBackground: GruvBoxLight.foreground_0.color,
    surface: GruvBoxLight.background_1.color,
    onSurface: GruvBoxLight.foreground_1.color,
    surfaceVariant: GruvBoxLight.background_1.color,
    onSurfaceVariant: GruvBoxLight.foreground_1.color,
    primaryContainer: GruvBoxLight.grayh.color,
    onPrimaryContainer: GruvBoxLight.foreground_0.color,
    tertiary: GruvBoxLight.grayl.color,
  ),
);
