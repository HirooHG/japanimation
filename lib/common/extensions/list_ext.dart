
import 'package:flutter/material.dart';

extension ListExt<T> on List<T> {

  T? nullWhere(bool Function(T) fun) {
    try {
      return singleWhere(fun);
    } catch (e) {
      return null;
    }
  }

  Iterable<Widget> toWidgets(Widget Function(T p) fun) {
    return map(fun);
  }
}
