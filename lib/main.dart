import 'package:flutter/material.dart';
import 'package:japanimationbloc/model/db/database_handler.dart';
import 'japanimation_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHandler().init();

  runApp(const JapanimationApp());
}
