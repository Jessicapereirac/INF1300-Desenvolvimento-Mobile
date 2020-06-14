import 'package:flutter/material.dart';

import 'internacionalizacao/translate.dart';

class registerCliente extends StatefulWidget {
  @override
  _registerClienteState createState() => _registerClienteState();
}

class _registerClienteState extends State<registerCliente> {


  TextEditingController _ControllerNome     = TextEditingController();
  TextEditingController _ControllerEmail    = TextEditingController();
  TextEditingController _ControllerSenha    = TextEditingController();
  TextEditingController _ControllerEndereco = TextEditingController();
  TextEditingController _ControllerNumero   = TextEditingController();

  String escolha ;
  bool termos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("at home",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Roboto',
            color: Colors.black,
          ),),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15,left: 15),

        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 60,bottom: 28),
                  child: Text(AppTranslate(context).text('registrar'),

                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 60,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(bottom: 10),
                          child: Text(AppTranslate(context).text('name'),
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
                              border: Border.all(
                                  color: Colors.black,
                                  width: 3
                              )

                          ),
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
                            decoration: InputDecoration.collapsed (hintText: ""),


                            onChanged: ( String text){},
                            controller: _ControllerEmail ,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                          child: Text("Email",
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
                              border: Border.all(
                                  color: Colors.black,
                                  width: 3
                              )

                          ),
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
                            decoration: InputDecoration.collapsed (hintText: ""),


                            onChanged: ( String text){},
                            controller: _ControllerEmail ,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                          child: Text(AppTranslate(context).text('senha'),
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
                              border: Border.all(
                                  color: Colors.black,
                                  width: 3
                              )

                          ),
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
                            decoration: InputDecoration.collapsed (hintText: ""),

                            onChanged: ( String text){},
                            controller: _ControllerSenha ,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                          child: Text(AppTranslate(context).text('endereco'),
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
                              border: Border.all(
                                  color: Colors.black,
                                  width: 3
                              )

                          ),
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
                            decoration: InputDecoration.collapsed (hintText: ""),


                            onChanged: ( String text){},
                            controller: _ControllerEmail ,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                          child: Text(AppTranslate(context).text('num'),
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
                              border: Border.all(
                                  color: Colors.black,
                                  width: 3
                              )

                          ),
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
                            decoration: InputDecoration.collapsed (hintText: ""),


                            onChanged: ( String text){},
                            controller: _ControllerEmail ,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                          child: Text(AppTranslate(context).text('sexo'),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Radio(value: "f",
                                    activeColor: Colors.black,
                                    groupValue: escolha, // groupValue é do mesmo tipo do value
                                    onChanged: (String es){
                                      setState(() {
                                        escolha = es;
                                      });
                                    }),
                                Text(AppTranslate(context).text('fem'),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[

                                Radio(value: "m",
                                    activeColor: Colors.black,
                                    groupValue: escolha, // groupValue é do mesmo tipo do value
                                    onChanged: (String es){
                                      setState(() {
                                        escolha = es;
                                      });
                                    }),
                                Text(AppTranslate(context).text('mas'),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1,
                                  ),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                    value: "o",
                                    activeColor: Colors.black,
                                    groupValue: escolha, // groupValue é do mesmo tipo do value
                                    onChanged: (String es){
                                      setState(() {
                                        escolha = es;
                                      });
                                    }),
                                Text(AppTranslate(context).text('outro'),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1,
                                  ),),
                              ],
                            ),
                            Row(
                              children: <Widget>[

                                Checkbox(
                                    value: termos,
                                    checkColor: Colors.white,
                                    activeColor: Colors.black,
                                    onChanged: (bool valor){
                                      setState(() {
                                        termos = valor;

                                      });
                                    }
                                ),
                                Text(AppTranslate(context).text('termos'),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),),
                              ],
                            ),


                          ],
                        )


                      ],
                    ),
                  )
              ),

              Padding(padding: EdgeInsets.only(top: 36),
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
                          AppTranslate(context).text('registro'),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),),
                      ],),
                  ),
                  onTap: (){
                    //TODO
                  },
                )
                ,)
            ],




          ),
        )
      ),
    );
  }
}
