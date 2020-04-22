@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text("ATM Consultoria",
        style: TextStyle(
          fontSize: 25,

        ),),
    ),
    body: Container(

      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 50, bottom: 0),
                    child: Image.asset("images/logo.png", height: 150,)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => abrirSegTela("empresa"),
                      child: Padding(padding: EdgeInsets.only(left: 0),
                          child: Image.asset("images/menu_empresa.png", height: 150,)),

                    ),
                    GestureDetector(
                        onTap: () => abrirSegTela("cliente"),
                        child: Image.asset("images/menu_cliente.png", height: 150,)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => abrirSegTela("servico"),
                      child: Padding(padding: EdgeInsets.only(left: 0),
                          child: Image.asset("images/menu_servico.png", height: 150,)),

                    ),
                    GestureDetector(
                        onTap: () => abrirSegTela("contato"),
                        child: Image.asset("images/menu_contato.png", height: 150,)),



                  ],
                )



              ],
            ),),



        ],
      ),
    ),
  );
}
}
