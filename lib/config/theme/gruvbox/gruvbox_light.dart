import 'package:flutter/material.dart';

enum GruvBoxLight {
  // background
  background_0(Color(0xFFFBF1C7)),
  background_0h(Color(0xFFF9F5D7)),
  background_0s(Color(0xFFF2E5BC)),
  background_1(Color(0xFFEBDBB2)),
  background_2(Color(0xFFD5C4A1)),
  background_3(Color(0xFFBDAE93)),
  background_4(Color(0xFFA89984)),

  // foreground
  foreground_0(Color(0xFF282828)),
  foreground_1(Color(0xFF3C3836)),
  foreground_2(Color(0xFF504945)),
  foreground_3(Color(0xFF665C54)),
  foreground_4(Color(0xFF7C6F64)),
  
  // colors hard
  redh(Color(0xFF9D0006)),
  greenh(Color(0xFF79740E)),
  yellowh(Color(0xFFB57614)),
  blueh(Color(0xFF076678)),
  purpleh(Color(0xFF8F3F71)),
  aquah(Color(0xFF427B58)),
  grayh(Color(0xFF928374)),
  orangeh(Color(0xFFAF3A03)),

  // colors light
  redl(Color(0xFFCC241D)),
  greenl(Color(0xFF98971A)),
  yellowl(Color(0xFFD79921)),
  bluel(Color(0xFF458588)),
  purplel(Color(0xFFB16286)),
  aqual(Color(0xFF689D6A)),
  grayl(Color(0xFF7C6F64)),
  orangel(Color(0xFFD65D0E))
  ;
  
  const GruvBoxLight(this.color);

  final Color color;
}
