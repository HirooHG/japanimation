
import 'package:japanimationbloc/api/api_client.dart';
import 'package:japanimationbloc/api/api_endpoint.dart';
import 'package:japanimationbloc/common/bloc/security_config/security_config.dart';
import 'package:japanimationbloc/common/bloc/security_config/security_config_keys.dart';
import 'package:japanimationbloc/domain/entities/user_token/user_token.dart';
import 'package:uuid/uuid.dart';

class LoginDataSource extends ApiClient {

  Future<String> login() async {
    String token = await get(
      ApiEndpoint.login,
      entity: UserToken(
        id: const Uuid().v1(),
        name: SecurityConfig.getProp(SecurityConfigKey.login),
        pwd: SecurityConfig.getProp(SecurityConfigKey.pwd)
      )
    );

    return token;
  }
}
