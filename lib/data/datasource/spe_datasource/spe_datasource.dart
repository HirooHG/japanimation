import 'dart:convert';

import 'package:japanimationbloc/api/api_client.dart';
import 'package:japanimationbloc/data/model/spe/spe_model.dart';

import 'package:japanimationbloc/api/api_endpoint.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';

class SpeDataSource extends ApiClient {

  Future<List<SpeModel>> getSpes() async {
    String str = await get(ApiEndpoint.spe);
    final List list = jsonDecode(str);

    return list.map((e) => SpeModel.fromJson(e)).toList();
  }

  Future<bool> postSpe(Spe spe) async {
    String str = await post(ApiEndpoint.spe, spe);
    return str.isEmpty;
  }

  Future<bool> putSpe(Spe spe) async {
    String str = await put(ApiEndpoint.spe, spe);
    return str.isEmpty;
  }

  Future<bool> deleteSpe(Spe spe) async {
    String str = await delete(ApiEndpoint.spe, spe);
    return str.isEmpty;
  }
}
