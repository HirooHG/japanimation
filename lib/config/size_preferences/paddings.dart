import 'package:flutter/material.dart';

enum Paddings {
  padding2(2),
  padding4(4),
  padding8(8),
  padding12(12),
  padding16(16),
  padding24(24),
  padding32(32),
  padding48(48),
  padding64(64),
  padding128(128),
  padding256(256),
  ;

  const Paddings(this.padding);

  final double padding;

  EdgeInsets get all => EdgeInsets.all(padding);
  EdgeInsets get top => EdgeInsets.only(top: padding);
  EdgeInsets get bot => EdgeInsets.only(bottom: padding);
  EdgeInsets get left => EdgeInsets.only(left: padding);
  EdgeInsets get right => EdgeInsets.only(right: padding);
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: padding);
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: padding);

  EdgeInsets get withoutTop => EdgeInsets.only(left: padding, right: padding, bottom: padding);
  EdgeInsets get withoutBottom => EdgeInsets.only(left: padding, right: padding, top: padding);
  EdgeInsets get withoutRight => EdgeInsets.only(left: padding, top: padding, bottom: padding);
  EdgeInsets get withoutLeft => EdgeInsets.only(top: padding, right: padding, bottom: padding);
}
