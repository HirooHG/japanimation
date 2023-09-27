
import 'package:flutter/services.dart';
import 'package:japanimationbloc/config/api/api_config_key.dart';
import 'package:yaml/yaml.dart';

class ApiConfig {

  static late final dynamic _yaml;

  static Future<void> getYaml() async {
    final yamlStr = await rootBundle.loadString("lib/config/api/config.yaml");
    _yaml = loadYaml(yamlStr);
  }

  static dynamic getProp(ApiConfigKey key) {
    return _yaml[key.name];
  }
}
