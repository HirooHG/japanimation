import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'modelview/blocobserver.dart';
import 'japanimationapp.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const JapanimationApp());
}
