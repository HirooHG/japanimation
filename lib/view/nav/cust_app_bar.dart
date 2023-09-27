
import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:japanimationbloc/config/theme/gruvbox/gruvbox_dark.dart';
import 'package:japanimationbloc/config/theme/gruvbox/gruvbox_light.dart';

class CustAppBar extends StatelessWidget {
  const CustAppBar({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5.0,
      shadowColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium
      ),
      actions: [
        DayNightSwitcher(
          dayBackgroundColor: GruvBoxLight.background_4.color,
          nightBackgroundColor: GruvBoxDark.foreground_1.color,
          moonColor: GruvBoxDark.background_0.color,
          starsColor: GruvBoxDark.background_2.color,
          isDarkModeEnabled: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
          onStateChanged: (value) {
            if(value) {
              AdaptiveTheme.of(context).setDark();
            } else {
              AdaptiveTheme.of(context).setLight();
            }
          }
        )
      ],
    );
  }
}
