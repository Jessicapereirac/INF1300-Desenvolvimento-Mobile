import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBD() async{
    final caminhoBD = await getDatabasesPath();
    final localBD = join(caminhoBD,"banco1.db");

    var ret = await openDatabase(localBD, version: 1, onCreate: (db, dbversao){
      db.execute("CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)");});

    return ret;

  }

  _salvar () async {
    Database bd = await _recuperarBD();

    Map<String, dynamic> dadosUsusario = {"nome": "jg", "idade": 14};
    int id = await bd.insert("usuarios", dadosUsusario);
    print("AQUI" + id.toString() );

  }

  _recuperarUsuarios() async{

    Database bd = await _recuperarBD();

    List usuarios = await bd.rawQuery("SELECT * FROM usuarios");

    for ( var u in usuarios){
      print(" id: " + u["id"].toString() +
          " nome: " + u["nome"] +
          " idade: "+ u["idade"].toString());
    }

  }

  _recuperarUsuario(int id) async {
    Database bd = await _recuperarBD();

    List usuarios = await bd.query("usuarios",
        columns: ["id", "nome", "idade"],
        where: "id = ?",
        whereArgs: [id]);

    for (var u in usuarios) {
      print(" id: " + u["id"].toString() +
          " nome: " + u["nome"] +
          " idade: " + u["idade"].toString());
    }
  }

  _removerUsuario( int id) async{

    Database bd = await _recuperarBD();

    bd.delete("usuarios", where: "id = ?", whereArgs: [id]);

  }

  _atualizarUsuario(int id ) async{

    Database bd = await _recuperarBD();

    Map<String, dynamic> dadosUsusario = {"nome": "Jaoa Guilherme", "idade": 14};
    bd.update("usuarios", dadosUsusario,where: "id = ?", whereArgs: [id]);

  }






  @override
  Widget build(BuildContext context) {
   // _recuperarUsuarios();
    _atualizarUsuario(3);
    _recuperarUsuarios();
    return Container();
  }
}
