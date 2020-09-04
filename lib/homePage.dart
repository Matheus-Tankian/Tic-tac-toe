
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settingsPage.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var num = 0;
  bool auxheight = true;

  int jogadas = 0;

  String data;
  String datao;

  var lista = List();

  bool click = false;

  void chamalista(){
    if(click==true){

    }else{
      click = !click;
    }
  }

  void inciaLista(){
    for(int i=0; i<9; i++){
      lista.insert(i, 0);
    }

    for(int i=0; i<9; i++){
      print(lista[i]);
    }

  }

  void primeiro(){
    setState(() {
      jogadas = jogadas + 1;
    });
  }

  void verificarJogada(){
    if(jogadas%2 == 0){
      print('par');
    }else if(jogadas%2 == 1){
      print('Inpar');
    }
  }

  void funcVerifica(value){
    if(value == 1){
      print(value);
      if(lista[0] == 1){
        print('e sim' );
        print(lista);
      }else{
        setState(() {
          print('e nao' );
          lista.insert(0, value);
          primeiro();

        });
      }

    }else if(value == 2){
      print(value);
      if(lista[1] == value){
        print('e sim' );
        print(lista);
      }else{
        setState(() {
          print('e nao' );
          lista.insert(1, value);
          primeiro();

        });
      }

    }else if(value == 3){

      print(value);
      if(lista[2] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {
          print('e nao');
          lista.insert(2, value);
          primeiro();
        });
      }

    }else if(value == 4){

      print(value);
      if(lista[3] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {
          print('e nao');
          lista.insert(3, value);
          primeiro();
        });
      }

    }else if(value == 5){

      print(value);
      if(lista[4] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {
          print('e nao');
          lista.insert(4, value);
          primeiro();
        });
      }

    }else if(value == 6){

      print(value);
      if(lista[5] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {
          print('e nao');
          lista.insert(5, value);
          primeiro();
        });
      }

    }else if(value == 7){

      print(value);
      if(lista[6] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {
          print('e nao');
          lista.insert(6, value);
          primeiro();
        });
      }

    }else if(value == 8){

      print(value);
      if(lista[7] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {
          print('e nao');
          lista.insert(7, value);
          primeiro();
        });
      }

    }else if(value == 9){

      print(value);
      if(lista[8] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {
          print('e nao');
          lista.insert(8, value);
          primeiro();
        });
      }
    }
  }




  @override

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: Text('Hash'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Show settingsPage',
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context)=> SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: (auxheight? (heightSize): 300),
        color: Colors.red,

        child: MainView(),
      ),
    );
  }
  Widget MainView(){
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    color: Colors.yellow,
                    child: Text(
                      'X 4',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    color: Colors.orangeAccent,
                    child: Text(
                      'O 4',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                flex: 2,
              ),
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            color: Colors.indigo,
            child: hash1(),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.indigo,
            child: hash2(),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            color: Colors.indigo,
            child: hash3(),
          ),
          flex: 1,
        ),

      ],
    );

  }

  Widget hash1(){




    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0,right: 4.0),
            color: Colors.green,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);

                  //inciaLista();
                  //inicia a inicalista uma vz e tudo funcona

                  funcVerifica(1);
                  verificarJogada();
                  print(jogadas);

                  print(lista[0]);


                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$datao': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(2);
                  verificarJogada();
                  print(jogadas);

                  print(lista[1]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                    (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.greenAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(3);
                  verificarJogada();
                  print(jogadas);

                  print(lista[2]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

      ],
    );
  }

  Widget hash2(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0,right: 4.0),
            color: Colors.green,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(4);
                  verificarJogada();
                  print(jogadas);

                  print(lista[3]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(5);
                  verificarJogada();
                  print(jogadas);

                  print(lista[4]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.greenAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(6);
                  verificarJogada();
                  print(jogadas);

                  print(lista[5]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

      ],
    );
  }

  Widget hash3(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0,right: 4.0),
            color: Colors.green,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(7);
                  verificarJogada();
                  print(jogadas);

                  print(lista[6]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(8);
                  verificarJogada();
                  print(jogadas);

                  print(lista[7]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.greenAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  //funClick(2);
                  //listaValores(2);
                  funcVerifica(9);
                  verificarJogada();
                  print(jogadas);

                  print(lista[8]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (click? '$data': ''),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

      ],
    );
  }


}

