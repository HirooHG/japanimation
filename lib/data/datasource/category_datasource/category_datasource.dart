
import 'dart:convert';

import 'package:japanimationbloc/api/api_client.dart';
import 'package:japanimationbloc/api/api_endpoint.dart';
import 'package:japanimationbloc/data/model/category/category_model.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';

class CategoryDataSource extends ApiClient {

  Future<List<CategoryModel>> getCategories() async {
    String str = await get(ApiEndpoint.category);
    final List list = jsonDecode(str);

    return list.map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<bool> postCat(Category cat) async {
    String str = await post(ApiEndpoint.category, cat);
    return str.isEmpty;
  }

  Future<bool> putCat(Category cat) async {
    String str = await put(ApiEndpoint.category, cat);
    return str.isEmpty;
  }

  Future<bool> deleteCat(Category cat) async {
    String str = await delete(ApiEndpoint.category, cat);
    return str.isEmpty;
  }
}
