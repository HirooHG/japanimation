import 'package:flutter/material.dart';
import 'package:japanimationbloc/config/theme/gruvbox/gruvbox_dark.dart';

final ThemeData themeDark = ThemeData(
  fontFamily: "Ubuntu",
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: GruvBoxDark.orangel.color,
    onPrimary: GruvBoxDark.foreground_0.color,
    secondary: GruvBoxDark.greenl.color,
    onSecondary: GruvBoxDark.foreground_0.color,
    error: GruvBoxDark.redh.color,
    onError: GruvBoxDark.foreground_0.color,
    background: GruvBoxDark.background_0h.color,
    onBackground: GruvBoxDark.foreground_0.color,
    surface: GruvBoxDark.background_0.color,
    onSurface: GruvBoxDark.foreground_0.color,
    surfaceVariant: GruvBoxDark.background_1.color,
    onSurfaceVariant: GruvBoxDark.foreground_1.color,
    primaryContainer: GruvBoxDark.grayh.color,
    onPrimaryContainer: GruvBoxDark.foreground_0.color,
    tertiary: GruvBoxDark.grayl.color,
  ),
);
