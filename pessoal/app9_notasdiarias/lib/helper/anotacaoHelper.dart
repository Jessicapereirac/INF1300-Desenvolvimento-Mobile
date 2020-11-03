import 'package:app9_notasdiarias/model/anotacao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class AnotacaoHelper{

  static final AnotacaoHelper _anotacaohelper = AnotacaoHelper._internal();
  Database _bd;

  factory AnotacaoHelper(){
    return _anotacaohelper;
  }

  AnotacaoHelper._internal(){}


  get banco async{

    if(_bd != null){
      return _bd;
    }else{
      _bd = await inializarDB();
      return _bd;
    }
  }

  _onCreat(Database bd, int v) async{
    String SQL = "CREATE TABLE anotacao (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo VARCHAR, descricao TEXT, data DATETIME )";
    await bd.execute(SQL);

  }
  
  inializarDB() async {
    final caminhoBD = await getDatabasesPath();
    final localBD = join(caminhoBD,"banco_notasdiarias");
    
    var bd = await openDatabase(localBD,version: 1, onCreate: _onCreat );
    return bd;
  }

  Future<int> salvarAnotacaoBD (Anotacao a) async {

    var bd = await banco;
    int id = await bd.insert("anotacao", a.toMap());

  }

  recuperarAnotacao() async{
    var bd = await banco;

    List anotacoes = await bd.rawQuery("SELECT * FROM anotacao ORDER BY data DESC");

    return anotacoes;
  }

  Future<int> removerAnotacao (int id) async{

    var bd = await banco;
    return await bd.delete(
        "anotacao",
        where: "id = ?",
        whereArgs:[id]
    );
  }

  Future<int> atualizarAnotacao (Anotacao anotacao) async{

    var bd = await banco;
    return await bd.update(
      "anotacao",
      anotacao.toMap(),
      where: "id = ?",
      whereArgs:[anotacao.id]
    );
  }

}