import 'package:com/Navigation.dart';
import 'package:com/helpers/client_helper.dart';
import 'package:com/internacionalizacao/translate.dart';
import 'package:flutter/material.dart';
import 'package:com/helpers/professional_helper.dart' as prof;
import 'package:com/resgisterCliente.dart';
import 'helpers/client_helper.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _ControllerEmail = TextEditingController();
  TextEditingController _ControllerSenha = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<Client> Login(BuildContext context) async {
    ClientHelper db_client = ClientHelper();
    if (_ControllerEmail.text.length < 1 || _ControllerSenha.text.length < 1) {
      final snack = SnackBar(
        content: Text("Preencha todos os campos!"),
        duration: Duration(seconds: 4),
      );
      _scaffoldKey.currentState.showSnackBar(snack);
      return null;
    }
    Map client_map = await db_client.LogInClientbyEmail(
        _ControllerEmail.text, _ControllerSenha.text);
    if (client_map['client'] == null) {
      final snack = SnackBar(
        content: Text("Senha ou email incorretos!"),
        duration: Duration(seconds: 4),
      );

      _scaffoldKey.currentState.showSnackBar(snack);
      return null;
    }
    return client_map['client'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "at home",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 28),
                    child: Text(
                      AppTranslate(context).text('login'),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 60,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                            ),
                            decoration: InputDecoration.collapsed(hintText: ""),
                            onChanged: (String text) {},
                            controller: _ControllerEmail,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            AppTranslate(context).text('senha'),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                            ),
                            decoration: InputDecoration.collapsed(hintText: ""),
                            onChanged: (String text) {},
                            controller: _ControllerSenha,
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Roboto',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => registerCliente()));
                          },
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            AppTranslate(context).text('entrar'),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      Client client = await Login(context);
                      if (client != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Navigation(client)));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
