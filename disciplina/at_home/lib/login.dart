

import 'package:com/Navigation.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _ControllerEmail = TextEditingController();
    TextEditingController _ControllerSenha = TextEditingController();

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

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60,bottom: 28),
              child: Text("Log In",

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 10),
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
                    child: Text("Senha",
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
                  GestureDetector(
                    child:
                    Padding(padding: EdgeInsets.only(top: 6, left: 232),
                      child: Text("Esqueceu a senha ?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onTap: (){},
                  )
                ],
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
                      "Sing In",
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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
            )
              ,)
          ],




        ),
      ),
    );
  }
}
