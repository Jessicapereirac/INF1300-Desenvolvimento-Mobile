import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';

final String clientTable = "clientTable";
final String idColumn = "id";
final String nameColumn = "name";
final String sexColumn = 'sex';
final String emailColumn = "email";
final String phoneColumn = "phone";
final String passwordColumn = "password";
final String imgColumn = "image";
final String zipcodeColumn = "zipCode";
final String regionColumn = "region";
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
          "$regionColumn TEXT NOT NULL, $zipcodeColumn TEXT NOT NULL)");
    });
  }

  Future<Client> saveClient(Client client) async {
    Database dbClient = await db;
    client.id = await dbClient.insert(clientTable, client.toMap());
    return client;
  }

  Future<Client> getClient(int id) async {
    Database dbClient = await db;
    List<Map> maps = await dbClient.query(clientTable,
        columns: [
          idColumn,
          nameColumn,
          sexColumn,
          emailColumn,
          phoneColumn,
          imgColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) return Client.fromMap(maps.first);
    return null;
  }

  Future<Map<String, Client>> LogInClientbyEmail(
      String email, String password) async {
    Database dbClient = await db;
    Map<String, Client> map_client = {"client": null};
    List<Map> map_id = await dbClient.query(clientTable,
        columns: [idColumn], where: "$emailColumn = ?", whereArgs: [email]);
    if (map_id.length == 0) return map_client;
    List<Map> maps_client = await dbClient.rawQuery(
        "SELECT $nameColumn, $emailColumn, $phoneColumn, $imgColumn FROM $clientTable WHERE $idColumn = ${map_id[0][idColumn]} AND $passwordColumn = \'$password\'");
    if( maps_client.length == 0) return map_client;
    map_client['client'] = Client.fromMap(maps_client[0]);
    return map_client;
  }

  Future<int> clientRegisted(String email) async {
    Database dbClient = await db;
    List<Map> maps = await dbClient.query(clientTable,
        columns: [emailColumn], where: "$emailColumn = ?", whereArgs: [email]);
    if (maps.length > 0) return 1;
    return 0;
  }

  Future<int> deleteClient(int id) async {
    Database dbClient = await db;
    return await dbClient
        .delete(clientTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateClient(Client contact) async {
    Database dbClient = await db;
    return await dbClient.update(clientTable, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllClients() async {
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
    this.city = map[regionColumn];
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
      regionColumn: this.city,
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
