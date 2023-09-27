
import 'package:japanimationbloc/data/datasource/login_datasource.dart/login_datasource.dart';

class GetLogin {
  final LoginDataSource dataSource;

  const GetLogin({
    required this.dataSource
  });

  Future<String> login() async {
    return await dataSource.login();
  }
}
