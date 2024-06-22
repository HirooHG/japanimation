import 'package:japanimationbloc/model/entities/base_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'dart:io';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/model/entities/category.dart';

class DatabaseHandler {
  static const _dbname = 'japanimation.db';
  static final DatabaseHandler _instance = DatabaseHandler._internal();
  static late final Database _db;

  factory DatabaseHandler() => _instance;

  DatabaseHandler._internal();

  Future<void> init() async {
    String path = await getDatabasesPath();
    _db = await openDatabase(
      join(path, _dbname),
      onCreate: (database, version) async {
        await database.execute("CREATE TABLE IF NOT EXISTS category ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL,"
            "identifier TEXT NOT NULL);");
        await database.execute("CREATE TABLE IF NOT EXISTS specification ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL,"
            "identifier TEXT NOT NULL);");
        await database.execute("CREATE TABLE IF NOT EXISTS animationEntity ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL,"
            "identifier TEXT NOT NULL,"
            "category INTEGER NULL,"
            "specification INTEGER NULL,"
            "episode INTEGER NULL,"
            "season INTEGER NULL,"
            "chapter INTEGER NULL,"
            "tome INTEGER NULL,"
            "FOREIGN KEY(category) REFERENCES category(id)"
            "FOREIGN KEY(specification) REFERENCES spe(id));");
      },
      version: 1,
    );
  }

  Future<void> deleteDatabase() async {
    String path = await getDatabasesPath();
    await File(join(path, _dbname)).delete();
  }

  Future<String?> insertEntity(BaseEntity entity) async {
    final res = await _db.insert(entity.className, entity.toJson());
    return res != 0 ? entity.identifier : null;
  }

  Future<String?> updateEntity(BaseEntity entity) async {
    // same as delete entity
    final res = await _db.update(entity.className, entity.toJson(),
        where: "identifier = ?", whereArgs: [entity.identifier]);
    return res != 0 ? entity.identifier : null;
  }

  Future<String?> deleteEntity(BaseEntity entity) async {
    final res = await _db.delete(entity.className,
        where: "identifier = ?", whereArgs: [entity.identifier]);
    return res != 0 ? entity.identifier : null;
  }

  Future<List<Specification>> getSpecifications() async {
    var result = await _db.query('specification');
    return result.map((e) => Specification.fromJson(e)).toList();
  }

  Future<List<AnimationEntity>> getAnimationEntities() async {
    var result = await _db.query('animationEntity');
    return result.map((e) => AnimationEntity.fromJson(e)).toList();
  }

  Future<List<Category>> getCategories() async {
    var categories = await _db.query('category');
    return categories.map((e) => Category.fromJson(e)).toList();
  }

  // get by identifier
  Future<BaseEntity> getEntityByIdentifier(BaseEntity entity) async {
    var result = await _db.query(entity.className,
        where: "identifier = ?", whereArgs: [entity.identifier]);
    switch (entity.className) {
      case 'animationEntity':
        return AnimationEntity.fromJson(result.first);
      case 'category':
        return Category.fromJson(result.first);
      default:
        return Specification.fromJson(result.first);
    }
  }
}
