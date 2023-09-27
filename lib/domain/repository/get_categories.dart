
import 'package:japanimationbloc/data/datasource/category_datasource/category_datasource.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';

class GetCategories {
  const GetCategories({required this.dataSource});

  final CategoryDataSource dataSource;

  Future<List<Category>> getCategories() async {
    final categories = await dataSource.getCategories();
    return categories.map((e) => e.toEntity()).toList();
  }

  Future<bool> postCat(Category cat) async {
    return await dataSource.postCat(cat);
  }

  Future<bool> putCat(Category cat) async {
    return await dataSource.putCat(cat);
  }

  Future<bool> deleteCat(Category cat) async {
    return await dataSource.deleteCat(cat);
  }
}
