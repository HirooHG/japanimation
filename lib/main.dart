import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:japanimationbloc/common/bloc/security_config/security_config.dart';
import 'package:japanimationbloc/config/api/api_config.dart';
import 'package:japanimationbloc/config/api/http_override.dart';
import 'package:japanimationbloc/data/datasource/data_source.dart';
import 'package:path_provider/path_provider.dart';
import 'japanimation_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  DataSource().init(mock: false);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory()
  );

  await ApiConfig.getYaml();
  await SecurityConfig.getYaml();
  
  runApp(const JapanimationApp());
}
