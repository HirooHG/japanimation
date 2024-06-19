import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:japanimationbloc/model/entities/animation_entity.dart';
import 'dart:io';
import 'package:japanimationbloc/model/entities/specification.dart';
import 'package:japanimationbloc/model/entities/category.dart';

class DatabaseHandler {
  const DatabaseHandler();

  final dbname = 'japanimation.db';

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, dbname),
      onCreate: (database, version) async {
        await database.execute("CREATE TABLE IF NOT EXISTS category ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL"
            ");");
        await database.execute("CREATE TABLE IF NOT EXISTS spe ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL"
            ");");
        await database.execute("CREATE TABLE IF NOT EXISTS thing ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL,"
            "idCategorie INTEGER NULL,"
            "idSpeciality INTEGER NULL,"
            "episode INTEGER NULL,"
            "season INTEGER NULL,"
            "chapter INTEGER NULL,"
            "tome INTEGER NULL,"
            "FOREIGN KEY(idCategorie) REFERENCES category(id)"
            "FOREIGN KEY(idSpeciality) REFERENCES spe(id)"
            ");");
      },
      version: 1,
    );
  }

  Future<void> deleteDatabase() async {
    String path = await getDatabasesPath();
    await File(join(path, dbname)).delete();
  }

  Future createTableSpeciality() async {
    final db = await initializeDB();
    await db.execute("CREATE TABLE IF NOT EXISTS spe ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "name TEXT NOT NULL"
        ");");
  }

  Future createTableCategory() async {
    var db = await initializeDB();
    await db.execute("CREATE TABLE IF NOT EXISTS category ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "name TEXT NOT NULL"
        ");");
  }

  Future createTableThing() async {
    var db = await initializeDB();
    await db.execute("CREATE TABLE IF NOT EXISTS thing ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "name TEXT NOT NULL,"
        "idCategorie INTEGER NULL,"
        "idSpeciality INTEGER NULL,"
        "episode INTEGER NULL,"
        "season INTEGER NULL,"
        "chapter INTEGER NULL,"
        "tome INTEGER NULL,"
        "FOREIGN KEY(idCategorie) REFERENCES category(id)"
        "FOREIGN KEY(idSpeciality) REFERENCES spe(id)"
        ");");
  }

  Future deleteTableCategory() async {
    var db = await initializeDB();
    await db.execute("DROP TABLE IF EXISTS category");
  }

  Future deleteTableThing() async {
    var db = await initializeDB();
    await db.execute("DROP TABLE IF EXISTS thing");
  }

  Future deleteTableSpeciality() async {
    var db = await initializeDB();
    await db.execute("DROP TABLE IF EXISTS spe");
  }

  Future insertSpeciality(Specification spe) async {
    var db = await initializeDB();
    await db.insert('spe', spe.toJson());
  }

  Future updateSpeciality(Specification spe) async {
    var db = await initializeDB();
    await db.update('spe', spe.toJson(), where: 'id = ?', whereArgs: [spe.id]);
  }

  Future deleteSpeciality(Specification spe) async {
    var db = await initializeDB();
    await db.delete('spe', where: 'id = ?', whereArgs: [spe.id]);
  }

  Future deleteAllSpeciality() async {
    var db = await initializeDB();
    await db.delete('spe');
  }

  Future<List<Specification>> getAllSpe() async {
    var db = await initializeDB();
    var result = await db.query('spe');
    return result.map((e) => Specification.fromJson(e)).toList();
  }

  Future<Specification> getSpeFromName(String name) async {
    var db = await initializeDB();
    var result = await db.query('spe', where: 'name = ?', whereArgs: [name]);
    return Specification.fromJson(result.first);
  }

  Future getSpecialityFromId(int id) async {
    var db = await initializeDB();
    var result = await db.query('spe', where: 'id = ?', whereArgs: [id]);
    return Specification.fromJson(result.first);
  }

  Future<void> insertThing(AnimationEntity thing) async {
    var db = await initializeDB();
    db.insert('thing', thing.toJson());
  }

  Future<void> updateThing(AnimationEntity thing) async {
    var db = await initializeDB();
    db.update('thing', thing.toJson(), where: 'id = ?', whereArgs: [thing.id]);
  }

  Future<void> deleteThing(AnimationEntity thing) async {
    var db = await initializeDB();
    db.delete('thing', where: 'id = ?', whereArgs: [thing.id]);
  }

  Future<void> deleteAllThing() async {
    var db = await initializeDB();
    db.delete('thing');
  }

  Future<List<AnimationEntity>> getThings() async {
    var db = await initializeDB();
    var things = await db.query('thing');
    return List.generate(things.length, (i) {
      return AnimationEntity.fromJson(things[i]);
    });
  }

  Future<List<AnimationEntity>> getThingsFromIdCategorie(
      int categorieId) async {
    var db = await initializeDB();
    var things = await db
        .query('thing', where: 'categorie_id = ?', whereArgs: [categorieId]);
    return List.generate(things.length, (i) {
      return AnimationEntity.fromJson(things[i]);
    });
  }

  Future<List<AnimationEntity>> getThingsFromName(String name) async {
    var db = await initializeDB();
    var things = await db.query('thing', where: 'name = ?', whereArgs: [name]);
    return List.generate(things.length, (i) {
      return AnimationEntity.fromJson(things[i]);
    });
  }

  Future<AnimationEntity> getThingFromId(int id) async {
    var db = await initializeDB();
    var things = await db.query('thing', where: 'id = ?', whereArgs: [id]);
    return AnimationEntity.fromJson(things[0]);
  }

  Future<void> insertCategory(Category category) async {
    var db = await initializeDB();
    db.insert('category', category.toJson());
  }

  Future<void> updateCategory(Category category) async {
    var db = await initializeDB();
    db.update('category', category.toJson(),
        where: 'id = ?', whereArgs: [category.id]);
  }

  Future<void> deleteCategory(Category category) async {
    var db = await initializeDB();
    db.delete('category', where: 'id = ?', whereArgs: [category.id]);
  }

  Future<void> deleteAllCategory() async {
    var db = await initializeDB();
    db.delete('category');
  }

  Future<List<Category>> getCategories() async {
    var db = await initializeDB();
    var categories = await db.query('category');
    return List.generate(categories.length, (i) {
      return Category.fromJson(categories[i]);
    });
  }

  Future<List<Category>> getCategoryFromName(String name) async {
    var db = await initializeDB();
    var categories =
        await db.query('category', where: 'name = ?', whereArgs: [name]);
    return List.generate(categories.length, (i) {
      return Category.fromJson(categories[i]);
    });
  }

  Future<Category> getCategoryFromId(int id) async {
    var db = await initializeDB();
    var categories =
        await db.query('category', where: 'id = ?', whereArgs: [id]);
    return Category.fromJson(categories[0]);
  }
}
