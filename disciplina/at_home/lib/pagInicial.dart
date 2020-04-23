

import 'package:flutter/material.dart';

class pagInicial extends StatefulWidget {
  @override
  _pagInicialState createState() => _pagInicialState();
}

class _pagInicialState extends State<pagInicial> {
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
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Image.asset("images/logo.png",height: 300,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    height: 80,
                    width: 178,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ],),),
                  onTap: (){
                    //TODO
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 80,
                    width: 178,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Register",
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
              ],
            )

          ],
        ),
      ),
    );
  }
}
