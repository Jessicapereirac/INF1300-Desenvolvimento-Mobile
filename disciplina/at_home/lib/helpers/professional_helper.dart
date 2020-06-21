import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';

final String professionalTable = "professionalTable";
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
final String serviceColumn = "serviceColumn";


class ProfessionalHelper {
  static final ProfessionalHelper _instance = ProfessionalHelper.internal();

  factory ProfessionalHelper() => _instance;

  ProfessionalHelper.internal();

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
    final path = join(databasePath, "professional.db");
    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $professionalTable($idColumn INTEGER PRIMARY KEY,"
          "$nameColumn TEXT NOT NULL, $sexColumn TEXT, $emailColumn TEXT NOT NULL, $passwordColumn TEXT NOT NULL, "
          "$phoneColumn TEXT NOT NULL, $imgColumn TEXT, $admindistrictColumn TEXT NOT NULL,"
          "$regionColumn TEXT NOT NULL, $zipcodeColumn TEXT NOT NULL, $serviceColumn TEXT NOT NULL)");
    });
  }

  Future<Professional> saveProfessional(Professional professional) async {
    Database dbProf = await db;
    professional.id = await dbProf.insert(professionalTable, professional.toMap());
    return professional;
  }

  Future<List> getProfessionals(String service) async {
    Database dbProf = await db;
    List<Map> maps = await dbProf.rawQuery("SELECT * FROM $professionalTable WHERE $serviceColumn = \'$service\';");
    return maps;
  }

  Future<int> deleteCProfessional(int id) async {
    Database dbProf = await db;
    return await dbProf
        .delete(professionalTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateProfessional(Professional contact) async {
    Database dbProf = await db;
    return await dbProf.update(professionalTable, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllProfessionals() async {
    Database dbProf = await db;
    List all_professionals = await dbProf.rawQuery("SELECT * FROM $professionalTable");
    List<Professional> listContact = List();
    for (Map m in all_professionals) {
      listContact.add(Professional.fromMap(m));
    }
    return listContact;
  }


}



class Professional {
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
  String service;

  Professional.fromMap(Map map) {
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
    this.service = map[serviceColumn];
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
      imgColumn: this.img,
      serviceColumn: this.service
    };
    if (id != null) map[idColumn] = this.id;
    return map;
  }

  @override
  String toString() {
    return "Professional(id: $id, name: $name, sex: $sex, password: $password, email: $email, phone: $phone, img: $img, state: $admindistrict, city: $city, zip code: $zipcode, service: $service)";
  }
}
