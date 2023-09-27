import 'package:japanimationbloc/data/datasource/advertisement_datasource/advertisement_datasource.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';

class GetAdvertisement {
  const GetAdvertisement({required this.dataSource});

  final AdvertisementDataSource dataSource;

  Future<List<Advertisement>> getAdvs() async {
    final advs = await dataSource.getAdvs();
    return advs.map((e) => e.toEntity()).toList();
  }

  Future<bool> postAdv(Advertisement adv) async {
    return await dataSource.postAdv(adv);
  }

  Future<bool> putAdv(Advertisement adv) async {
    return await dataSource.putAdv(adv);
  }

  Future<bool> deleteAdv(Advertisement adv) async {
    return await dataSource.deleteAdv(adv);
  }
}
