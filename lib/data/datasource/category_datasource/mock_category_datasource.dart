
import 'package:japanimationbloc/data/datasource/category_datasource/category_datasource.dart';
import 'package:japanimationbloc/data/model/category/category_model.dart';
import 'package:uuid/uuid.dart';

class MockCategoryDataSource extends CategoryDataSource {

  @override
  Future<List<CategoryModel>> getCategories() async {
    return [
      "anime",
      "manga",
      "manhwa",
      "hentai"
    ].map((e) => CategoryModel(id: const Uuid().v1(), name: e)).toList();
  }
}
