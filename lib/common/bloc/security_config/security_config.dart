import 'package:flutter/services.dart';
import 'package:japanimationbloc/common/bloc/security_config/security_config_keys.dart';
import 'package:yaml/yaml.dart';

class SecurityConfig {

  static late final dynamic _yaml;

  static Future<void> getYaml() async {
    final yamlStr = await rootBundle.loadString("lib/common/bloc/security_config/config.yaml");
    _yaml = loadYaml(yamlStr);
  }

  static dynamic getProp(SecurityConfigKey key) {
    return _yaml[key.name];
  }
}
