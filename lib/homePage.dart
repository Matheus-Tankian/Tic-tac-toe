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

 List<int> lista = new List(9);

 List<String>lt2 = new List(9);

  bool click = false;

//  void apo(value){
//    for(int i=0;i<9;i++){
//      print(lts[i]);
//      if(lts[1]==0){
//        setState(() {
//          lts[1]=value;
//        });
//      }
//    }
//
//  }

  void inicia(funcval, verival){
    if(click==false){
      for(int i=0;i<9;i++){
        setState(() {
          lista[i] = 0;

        });
      }
      setState(() {
        click = !click;
      });

      funcVerifica(funcval,verival);


    }else if(click==true){
      print("clicl true");
      funcVerifica(funcval,verival);

    }
  }




  void primeiro(){
    setState(() {
      jogadas = jogadas + 1;
    });
  }

  void verificarJogada(value){
    if(jogadas%2 == 0){
      print('par');
      setState(() {
        lt2[value] = 'X';
      });
    }else if(jogadas%2 == 1){
      print('Inpar');
      setState(() {
        lt2[value] = 'O';
      });
    }
  }

  void funcVerifica(value, verival){
    if(value == 1){
      print(value);
      if(lista[0] == 1){
        print('e sim' );
      }else{
        print('e nao' );
        setState(() {
         lista[0] = value;
        });
        verificarJogada(verival);
      primeiro();
      }

    }else if(value == 2){
      print(value);
      if(lista[1] == value){
        print('e sim' );
        print(lista);
      }else{
        print('e nao' );
        setState(() {
          lista[1]=value;
        });
        verificarJogada(verival);
        primeiro();
      }

    }else if(value == 3){

      print(value);
      if(lista[2] == value){

      }else {
        setState(() {

          lista[2]= value;
        });
        verificarJogada(verival);
        primeiro();
      }

    }else if(value == 4){

      print(value);
      if(lista[3] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {

          lista[3]=value;

        });
        verificarJogada(verival);
        primeiro();
      }

    }else if(value == 5){

      print(value);
      if(lista[4] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {

          lista[4]=value;

        });
        verificarJogada(verival);
        primeiro();
      }

    }else if(value == 6){

      print(value);
      if(lista[5] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {

          lista[5]=value;

        });
        verificarJogada(verival);
        primeiro();
      }

    }else if(value == 7){

      print(value);
      if(lista[6] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {

          lista[6]=value;

        });
        verificarJogada(verival);
        primeiro();
      }

    }else if(value == 8){

      print(value);
      if(lista[7] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {

          lista[7]=value;

        });
        verificarJogada(verival);
        primeiro();
      }

    }else if(value == 9){

      print(value);
      if(lista[8] == value){
        print('e sim' );
        print(lista);
      }else {
        setState(() {

          lista[8]=value;

        });
        verificarJogada(verival);
        primeiro();
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
        color: Colors.indigo,
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
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child:Center(
                            child: Text(
                              'Play1',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          flex: 2,
                        ),

                        Expanded(
                          child:Center(
                            child: Text(
                              'X',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child:Center(
                            child: Text(
                              'Play2 ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          flex: 2,
                        ),

                        Expanded(
                          child:Center(
                            child: Text(
                              'O',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          flex: 3,
                        ),
                      ],
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
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {

                  inicia(1, 0);

                  print(jogadas);

                  print(lista[0]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[0]==null? '' :'${lt2[0]}'),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {

                  inicia(2, 1);
                 print(jogadas);

                  print(lista[1]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[1]==null? '' :'${lt2[1]}'),
                ),

              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {

                  inicia(3, 2);
                  print(jogadas);

                  print(lista[2]);


                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[2]==null? '' :'${lt2[2]}'),
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
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  inicia(4, 3);
                  print(jogadas);

                  print(lista[3]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[3]==null? '' :'${lt2[3]}'),
                ),
              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  inicia(5, 4);

                  print(jogadas);

                  print(lista[4]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[4]==null? '' :'${lt2[4]}'),
                ),

              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  inicia(6, 5);

                  print(jogadas);

                  print(lista[5]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[5]==null? '' :'${lt2[5]}'),
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
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {

                  inicia(7, 6);

                  print(jogadas);

                  print(lista[6]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[6]==null? '' :'${lt2[6]}'),
                ),

              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  inicia(8, 7);

                  print(jogadas);

                  print(lista[7]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[7]==null? '' :'${lt2[7]}'),
                ),

              ),
            ),
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: FlatButton(
                onPressed: () {


                  inicia(9, 8);
                  print(jogadas);

                  print(lista[8]);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[8]==null? '' :'${lt2[8]}'),
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
