import 'package:sqflite/sqflite.dart';

class SqlDB {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initializeDB();
      return _db!;
    }
  }

  initializeDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = '$dataBasePath/cart.db';
    Database database = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return database;
  }

  _onCreate(Database database, int version) async {
    await database.execute('''CREATE TABLE "cart" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
  "product_id" INTEGER,
  "name" TEXT,
  "price" REAL, 
  "imageUrl" TEXT, 
  "quantity" INTEGER
)
''');

    await database.execute('''
      CREATE TABLE "favorites" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "product_id" INTEGER UNIQUE,
        "name" TEXT,
        "price" REAL,
        "imageUrl" TEXT
      )
    ''');
    print("database created");
  }

  _onUpgrade(Database database, int oldVersion, int newVersion) async {}

  selectData(String sql) async {
    Database? database = await db;
    List<Map> response = await database.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? database = await db;
    int response = await database.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? database = await db;
    int response = await database.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? database = await db;
    int response = await database.rawDelete(sql);
    return response;
  }

  Future<int> clearTable() async {
    Database? database = await db;
    int response = await database.delete('cart');
    return response;
  }
}
