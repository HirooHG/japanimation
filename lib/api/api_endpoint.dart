
import 'package:japanimationbloc/config/api/api_config.dart';
import 'package:japanimationbloc/config/api/api_config_key.dart';

enum ApiEndpoint {
  category,
  spe,
  login,
  advertisement;

  String get host => ApiConfig.getProp(ApiConfigKey.address);
  int get port => ApiConfig.getProp(ApiConfigKey.port);
  String get path {
    if(name == "login") {
      return name;
    }
    return "${ApiConfig.getProp(ApiConfigKey.path)}/$name";
  }
}
