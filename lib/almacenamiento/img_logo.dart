import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

class UrlLink {
  final String url;

  UrlLink(this.url);

  UrlLink.fromJson(Map<String, dynamic> parsedJoson) : url = parsedJoson['url'];

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}

class SQLOperations {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE urlImage(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          url TEXT
      )""");
  }

  static Future<sql.Database> db() async {
    print('Your code runs normally like a weird');
    return sql.openDatabase('logistica_imgTable.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      print('... CREATING A TABLE ...');
      await createTables(database);
      print('.. TABLE CREATED ..');
    });
  }

  static Future<int> createItem(String url) async {
    final db = await SQLOperations.db();
    print('CREATING ITEM...');
    final data = {'url': url};
    final id = await db.insert('urlImage', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print('ITEM CREATED SUCCESSFULY');
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLOperations.db();
    return db.query('urlImage', orderBy: "id");
  }
}
