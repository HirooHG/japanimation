import 'dart:convert';

import 'package:japanimationbloc/data/model/advertisement/advertisement_model.dart';
import 'package:japanimationbloc/api/api_client.dart';
import 'package:japanimationbloc/api/api_endpoint.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';

class AdvertisementDataSource extends ApiClient{

  Future<List<AdvertisementModel>> getAdvs() async {
    String str = await get(ApiEndpoint.advertisement);
    final List list = jsonDecode(str);

    return list.map((e) => AdvertisementModel.fromJson(e)).toList();
  }

  Future<bool> postAdv(Advertisement adv) async {
    String str = await post(ApiEndpoint.advertisement, adv);
    return str.isEmpty;
  }

  Future<bool> putAdv(Advertisement adv) async {
    String str = await put(ApiEndpoint.advertisement, adv);
    return str.isEmpty;
  }

  Future<bool> deleteAdv(Advertisement adv) async {
    String str = await delete(ApiEndpoint.advertisement, adv);
    return str.isEmpty;
  }
}
