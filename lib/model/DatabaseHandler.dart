import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:japanimationbloc/modelview/thing/thing.dart';
import 'dart:io';

class DatabaseHandler {

  final dbname = 'japanimation.db';

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, dbname),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE IF NOT EXISTS category ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL"
          ");"
        );
        await database.execute(
          "CREATE TABLE IF NOT EXISTS thing ("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL,"
            "idCategorie INTEGER NULL,"
            "episode INTEGER NULL,"
            "season INTEGER NULL,"
            "chapter INTEGER NULL,"
            "tome INTEGER NULL,"
            "FOREIGN KEY(idCategorie) REFERENCES category(id)"
          ");"
        );
      },
      version: 1,
    );
  }
  Future createTableCategory() async {
    var db = await initializeDB();
    await db.execute(
      "CREATE TABLE IF NOT EXISTS category ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "name TEXT NOT NULL"
      ");"
    );
  }
  Future createTableThing() async {
    var db = await initializeDB();
    await db.execute(
      "CREATE TABLE IF NOT EXISTS thing ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "name TEXT NOT NULL,"
        "idCategorie INTEGER NULL,"
        "episode INTEGER NULL,"
        "season INTEGER NULL,"
        "chapter INTEGER NULL,"
        "tome INTEGER NULL,"
        "FOREIGN KEY(idCategorie) REFERENCES category(id)"
      ");"
    );
  }
  Future<void> deleteDatabase() async {
    String path = await getDatabasesPath();
    await File(join(path, dbname)).delete();
  }
  Future deleteTableCategory() async {
    var db = await initializeDB();
    await db.execute("DROP TABLE IF EXISTS category");
  }
  Future deleteTableThing() async {
    var db = await initializeDB();
    await db.execute("DROP TABLE IF EXISTS thing");
  }

  Future<void> insertThing(Thing thing) async {
    var db = await initializeDB();
    db.insert('thing', thing.toMap());
  }
  Future<void> updateThing(Thing thing) async {
    var db = await initializeDB();
    db.update('thing', thing.toMap(), where: 'id = ?', whereArgs: [thing.id]);
  }
  Future<void> deleteThing(Thing thing) async {
    var db = await initializeDB();
    db.delete('thing', where: 'id = ?', whereArgs: [thing.id]);
  }
  Future<void> deleteAllThing() async {
    var db = await initializeDB();
    db.delete('thing');
  }
  Future<List<Thing>> getThings() async {
    var db = await initializeDB();
    var things = await db.query('thing');
    return List.generate(things.length, (i) {
      return Thing.fromBdd(things[i]);
    });
  }
  Future<List<Thing>> getThingsFromIdCategorie(int categorieId) async {
    var db = await initializeDB();
    var things = await db.query('thing', where: 'categorie_id = ?', whereArgs: [categorieId]);
    return List.generate(things.length, (i) {
      return Thing.fromBdd(things[i]);
    });
  }
  Future<List<Thing>> getThingsFromName(String name) async {
    var db = await initializeDB();
    var things = await db.query('thing', where: 'name = ?', whereArgs: [name]);
    return List.generate(things.length, (i) {
      return Thing.fromBdd(things[i]);
    });
  }
  Future<Thing> getThingFromId(int id) async {
    var db = await initializeDB();
    var things = await db.query('thing', where: 'id = ?', whereArgs: [id]);
    return Thing.fromBdd(things[0]);
  }

  Future<void> insertCategory(Category category) async {
    var db = await initializeDB();
    db.insert('category', category.toMap());
  }
  Future<void> updateCategory(Category category) async {
    var db = await initializeDB();
    db.update('category', category.toMap(), where: 'id = ?', whereArgs: [category.id]);
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
      return Category.fromBdd(categories[i]);
    });
  }
  Future<List<Category>> getCategoryFromName(String name) async {
    var db = await initializeDB();
    var categories = await db.query('category', where: 'name = ?', whereArgs: [name]);
    return List.generate(categories.length, (i) {
      return Category.fromBdd(categories[i]);
    });
  }
  Future<Category> getCategoryFromId(int id) async {
    var db = await initializeDB();
    var categories = await db.query('category', where: 'id = ?', whereArgs: [id]);
    return Category.fromBdd(categories[0]);
  }
}