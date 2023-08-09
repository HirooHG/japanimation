import 'package:flutter/material.dart';

enum GruvBoxDark {
  // background
  background_0(Color(0xFF282828)),
  background_0h(Color(0xFF1D2021)),
  background_0s(Color(0xFF32302F)),
  background_1(Color(0xFF3C3836)),
  background_2(Color(0xFF504945)),
  background_3(Color(0xFF665c54)),
  background_4(Color(0xFF7C6F64)),

  // foreground
  foreground_0(Color(0xFFFBF1C7)),
  foreground_1(Color(0xFFEBDBB2)),
  foreground_2(Color(0xFFD5C4A1)),
  foreground_3(Color(0xFFBDAE93)),
  foreground_4(Color(0xFFA89984)),
  
  // colors hard
  redh(Color(0xFFCC341D)),
  greenh(Color(0xFF98971A)),
  yellowh(Color(0xFFD79921)),
  blueh(Color(0xFF458588)),
  purpleh(Color(0xFFB16286)),
  aquah(Color(0xFF689D6A)),
  grayh(Color(0xFF928374)),
  orangeh(Color(0xFFD65D0E)),

  // colors light
  redl(Color(0xFFFB4934)),
  greenl(Color(0xFFB8BB26)),
  yellowl(Color(0xFFFABD2F)),
  bluel(Color(0xFF83A598)),
  purplel(Color(0xFFD3869B)),
  aqual(Color(0xFF689D6A)),
  grayl(Color(0xFFA89984)),
  orangel(Color(0xFFFE8019))
  ;
  
  const GruvBoxDark(this.color);

  final Color color;
}
