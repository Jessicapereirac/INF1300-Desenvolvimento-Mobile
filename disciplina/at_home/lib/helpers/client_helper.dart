import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

final String clientTable = "clientTable";
final String idColumn = "id";
final String nameColumn = "name";
final String sexColumn = 'sex';
final String emailColumn = "email";
final String phoneColumn = "phone";
final String passwordColumn = "password";
final String imgColumn = "image";
final String zipcodeColumn = "zipCode";
final String cityColumn = "city";
final String admindistrictColumn = "adminDistrict";

class ClientHelper {
  static final ClientHelper _instance = ClientHelper.internal();

  factory ClientHelper() => _instance;

  ClientHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "clients.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $clientTable($idColumn INTEGER PRIMARY KEY,"
          "$nameColumn TEXT NOT NULL, $sexColumn TEXT, $emailColumn TEXT NOT NULL, $passwordColumn TEXT NOT NULL, "
          "$phoneColumn TEXT NOT NULL, $imgColumn TEXT, $admindistrictColumn TEXT NOT NULL,"
          "$cityColumn TEXT NOT NULL, $zipcodeColumn TEXT NOT NULL)");
    });
  }

  Future<Client> saveContact(Client client) async {
    Database dbClient = await db;
    client.id = await dbClient.insert(clientTable, client.toMap());
    return client;
  }

  Future<Client> getContact(int id) async {
    Database dbClient = await db;
    List<Map> maps = await dbClient.query(clientTable,
        columns: [idColumn, nameColumn, sexColumn, emailColumn, phoneColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) return Client.fromMap(maps.first);
    return null;
  }

  Future<int> deleteContact(int id) async {
    Database dbClient = await db;
    return await dbClient
        .delete(clientTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Client contact) async {
    Database dbClient = await db;
    return await dbClient.update(clientTable, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    Database dbClient = await db;
    List all_clients = await dbClient.rawQuery("SELECT * FROM $clientTable");
    List<Client> listContact = List();
    for (Map m in all_clients) {
      listContact.add(Client.fromMap(m));
    }
    return listContact;
  }

  Future<int> getNumber() async {
    Database dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $clientTable"));
  }

  Future close() async {
    Database dbClient = await db;
    dbClient.close();
  }
}

class Client {
  int id;
  String name;
  String sex;
  String email;
  String phone;
  String password;
  String img;
  String zipcode;
  String city;
  String admindistrict;

  Client.fromMap(Map map) {
    this.id = map[idColumn];
    this.name = map[nameColumn];
    this.sex = map[sexColumn];
    this.email = map[emailColumn];
    this.phone = map[phoneColumn];
    this.password = map[passwordColumn];
    this.zipcode = map[zipcodeColumn];
    this.city = map[cityColumn];
    this.admindistrict = map[admindistrictColumn];
    this.img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: this.name,
      sexColumn: this.sex,
      emailColumn: this.email,
      passwordColumn: this.password,
      admindistrictColumn: this.admindistrict,
      cityColumn: this.city,
      zipcodeColumn: this.zipcode,
      phoneColumn: this.phone,
      imgColumn: this.img
    };
    if (id != null) map[idColumn] = this.id;
    return map;
  }

  @override
  String toString() {
    return "Client(id: $id, name: $name, sex: $sex, password: $password, email: $email, phone: $phone, img: $img, state: $admindistrict, city: $city, zip code: $zipcode)";
  }
}
