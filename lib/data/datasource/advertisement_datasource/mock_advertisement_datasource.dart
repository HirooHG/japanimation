
import 'package:japanimationbloc/data/datasource/advertisement_datasource/advertisement_datasource.dart';
import 'package:japanimationbloc/data/model/advertisement/advertisement_model.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:uuid/uuid.dart';

class MockAdvertisementDataSource extends AdvertisementDataSource {

  @override
  Future<List<AdvertisementModel>> getAdvs() async {
    return [
      "berserk",
      "blue lock",
      "slime san",
      "darwin's game"
    ].map((e) => AdvertisementModel(id: const Uuid().v1(), name: e)).toList();
  }

  @override
  Future<bool> postAdv(Advertisement adv) {
    return Future.value(false);
  }

  @override
  Future<bool> putAdv(Advertisement adv) {
    return Future.value(false);
  }

  @override
  Future<bool> deleteAdv(Advertisement adv) {
    return Future.value(false);
  }
}
