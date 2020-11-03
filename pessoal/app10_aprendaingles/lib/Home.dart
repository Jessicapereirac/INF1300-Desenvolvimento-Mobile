import 'package:app10_aprendaingles/Numeros.dart';
import 'package:app10_aprendaingles/bichos.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'Video.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: 0
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Aprendendo Inglês"),
        bottom: TabBar(
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Bichos",
              //icon: Icon(Icons.home),
            ),
            Tab(
              text: "Números",
              //icon: Icon(Icons.email),
            ),
            Tab(
              text: "Vogais",
              //icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          bichos(),
          Numeros(),
          Video(),

        ],

      ),

    );
  }
}
