import 'package:app9_notasdiarias/helper/anotacaoHelper.dart';
import 'package:app9_notasdiarias/model/anotacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _tituloController= TextEditingController();
  TextEditingController _descricaoController= TextEditingController();

  Anotacao _ultimaAs ;

  List<Anotacao> _as = List<Anotacao>();

  var _bd = AnotacaoHelper();

  _recuperarAnotacao() async{

    List anotacoes = await _bd.recuperarAnotacao();

    List<Anotacao> temp = List<Anotacao>();
    for (var i in anotacoes){

      Anotacao an = Anotacao.fromMap(i);
      temp.add(an);

    }

    setState(() {
      _as = temp;
    });

    temp= null;
  }

  _salvarAnotacao({anotacaoSelecionada}){

    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    String info ="";
    if(anotacaoSelecionada != null){
      info ="Atualizar";

      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = DateTime.now().toString();
      _bd.atualizarAnotacao(anotacaoSelecionada);

    }else{

      Anotacao a = Anotacao(titulo, descricao, DateTime.now().toString());
      _bd.salvarAnotacaoBD(a);

    }

    _tituloController.clear();
    _descricaoController.clear();

    _recuperarAnotacao();

  }

  _formatardata(String data){

    initializeDateFormatting("pt_BR");

    var f = DateFormat.yMd("pt_BR");

    DateTime dtconvert = DateTime.parse(data);
    String datanova = f.format(dtconvert);

    return datanova;
  }

  _exibirCadastroAnotacao({anotacao}){

    String info ="";
    if(anotacao != null){
      info ="Atualizar";

      _tituloController.text = anotacao.titulo;
      _descricaoController.text = anotacao.descricao;

    }else{

      _tituloController.clear();
      _descricaoController.clear();
      info ="Adicionar";

    }

    showDialog(
        context: context,
      builder: (context){
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text("$info anotação"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      controller: _tituloController,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "Título",
                          hintText: "Digite o título"
                      )
                  ),

                  TextField(
                      controller: _descricaoController,
                      decoration: InputDecoration(
                          labelText: "Descrição",
                          hintText: "Digite uma descrição"
                      )
                  )
                ],
              ),
              actions: [
                FlatButton(
                    onPressed:() => Navigator.pop(context),
                    child: Text("Cancelar")
                ),
                FlatButton(
                    onPressed:() {
                      _salvarAnotacao(anotacaoSelecionada: anotacao);
                      Navigator.pop(context);
                    },
                    child: Text(info)
                )
              ],
            )
          );
      }
    );

  }

  _removerAnotacao(int id) async{

    await _bd.removerAnotacao(id);
    _recuperarAnotacao();

  }

  _adicionarAnotacao(anotacao){

    _bd.salvarAnotacaoBD(anotacao);

  }

  Widget criarItem(context,index){

    final anotacao = _as[index];

    return Dismissible(

        secondaryBackground: Container(
            color: Colors.red,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete,
                    color: Colors.white),
              ],
            )
        ),
        background: Container(
            color: Colors.green,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.edit,
                    color: Colors.white),
              ],
            )
        ),
        onDismissed:(direction){

          if (direction == DismissDirection.endToStart){

            _ultimaAs = _as[index];

            setState(() {
              _as.removeAt(index);
              _removerAnotacao(_ultimaAs.id);
            });

            final snackbar = SnackBar(
              //backgroundColor: Colors.grey,
              duration: Duration(seconds: 5),
              content: Text("Deseja desfazer a ação ?"),
              action: SnackBarAction(
                  label: "Desfazer",
                  onPressed: (){

                    _adicionarAnotacao(_ultimaAs);

                    setState(() {
                      _as.insert(index,_ultimaAs);
                    });

                    _recuperarAnotacao();

                  }
              ),);
            Scaffold.of(context).showSnackBar(snackbar);

          }else if (direction == DismissDirection.startToEnd){

            _exibirCadastroAnotacao(anotacao: anotacao);

          }
        },
        key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
        child:Card(
          elevation: 15,
          child: ListTile(
           title: Text(anotacao.titulo),
            subtitle: Text("${_formatardata(anotacao.data)} - ${anotacao.descricao}"),

      ),

    ));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarAnotacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("minhas anotações"),
      backgroundColor: Colors.purple),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: _as.length,
                  itemBuilder: criarItem

                  ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(

        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        icon: Icon(Icons.add),
        label: Text("adicionar"),
        onPressed: (){
          _exibirCadastroAnotacao();

        }
    ),
    );
    }
  }

