import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settingsPage.dart';


class HomePage extends StatefulWidget {

  final String nameP1;
  final String nameP2;

  const HomePage({Key key, this.nameP1,this.nameP2 }): super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 // var num = 0;
  bool auxheight = true;
  bool xwin = false;
  bool owin = false;
  bool empate = false;
  bool click = false;
  int jogadas = 0;


  //String data;
  //String datao;

 List<int> lista = new List(9);

 List<String>lt2 = new List(9);







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
    if(((jogadas == 8) && (owin == false))||((jogadas == 8) && (xwin == false))){
      setState(() {
        empate = !empate;
      });
      resultFinal();
    }else{
      setState(() {
        jogadas = jogadas + 1;
      });
      resultFinal();
    }
  }

  void verificarJogada(value){
    if(jogadas%2 == 0){
      print('par');
      setState(() {
        lt2[value] = 'X';
      });
      //resultFinal();
    }else if(jogadas%2 == 1){
      print('Inpar');
      setState(() {
        lt2[value] = 'O';
      });
      //resultFinal();
    }
    //resultFinal();
  }

  void resultFinal(){
    if((((lt2[0]=='X')&&(lt2[1]=='X')&&(lt2[2]=='X')) || ((lt2[2]=='X')&&(lt2[1]=='X')&&(lt2[0]=='X'))) ||
        (((lt2[3]=='X')&&(lt2[4]=='X')&&(lt2[5]=='X')) || ((lt2[5]=='X')&&(lt2[4]=='X')&&(lt2[3]=='X'))) ||
        (((lt2[6]=='X')&&(lt2[7]=='X')&&(lt2[8]=='X')) || ((lt2[8]=='X')&&(lt2[7]=='X')&&(lt2[6]=='X'))) ||
        (((lt2[0]=='X')&&(lt2[3]=='X')&&(lt2[6]=='X')) || ((lt2[6]=='X')&&(lt2[3]=='X')&&(lt2[0]=='X'))) ||
        (((lt2[1]=='X')&&(lt2[4]=='X')&&(lt2[7]=='X')) || ((lt2[7]=='X')&&(lt2[4]=='X')&&(lt2[1]=='X'))) ||
        (((lt2[2]=='X')&&(lt2[5]=='X')&&(lt2[8]=='X')) || ((lt2[8]=='X')&&(lt2[5]=='X')&&(lt2[2]=='X'))) ||
        (((lt2[0]=='X')&&(lt2[4]=='X')&&(lt2[8]=='X')) || ((lt2[8]=='X')&&(lt2[4]=='X')&&(lt2[0]=='X'))) ||
        (((lt2[2]=='X')&&(lt2[4]=='X')&&(lt2[6]=='X')) || ((lt2[6]=='X')&&(lt2[4]=='X')&&(lt2[2]=='X')))){
        setState(() {
          xwin = true;
        });
      print('X ganhou');
      showAlertDialogXwin(context);

    }else  if((((lt2[0]=='O')&&(lt2[1]=='O')&&(lt2[2]=='O')) || ((lt2[2]=='O')&&(lt2[1]=='O')&&(lt2[0]=='O'))) ||
        (((lt2[3]=='O')&&(lt2[4]=='O')&&(lt2[5]=='O')) || ((lt2[5]=='O')&&(lt2[4]=='O')&&(lt2[3]=='O'))) ||
        (((lt2[6]=='O')&&(lt2[7]=='O')&&(lt2[8]=='O')) || ((lt2[8]=='O')&&(lt2[7]=='O')&&(lt2[6]=='O'))) ||
        (((lt2[0]=='O')&&(lt2[3]=='O')&&(lt2[6]=='O')) || ((lt2[6]=='O')&&(lt2[3]=='O')&&(lt2[0]=='O'))) ||
        (((lt2[1]=='O')&&(lt2[4]=='O')&&(lt2[7]=='O')) || ((lt2[7]=='O')&&(lt2[4]=='O')&&(lt2[1]=='O'))) ||
        (((lt2[2]=='O')&&(lt2[5]=='O')&&(lt2[8]=='O')) || ((lt2[8]=='O')&&(lt2[5]=='O')&&(lt2[2]=='O'))) ||
        (((lt2[0]=='O')&&(lt2[4]=='O')&&(lt2[8]=='O')) || ((lt2[8]=='O')&&(lt2[4]=='O')&&(lt2[0]=='O'))) ||
        (((lt2[2]=='O')&&(lt2[4]=='O')&&(lt2[6]=='O')) || ((lt2[6]=='O')&&(lt2[4]=='O')&&(lt2[2]=='O')))){

      setState(() {
        owin = true;
      });
      print('O ganhou');
      showAlertDialogOwin(context);

    }else{
      if((empate == true) && (owin == false) ||
          (empate == true) && (xwin == false)){
        showAlertDialogAtie(context);
      }
    }
  }

  showAlertDialogXwin(BuildContext context) {

    Widget continuaButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        Navigator.of(context).pop();
        for(int i=0;i<9;i++){
         setState(() {
           lista[i] = null;
           lt2[i] = null;
         });
        }
        setState(() {
          jogadas = 0;
          empate =false;
          xwin = false;
          owin = false;
        });
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Congratulations you won"),
      content: Text((this.widget.nameP1!=null? '${this.widget.nameP1} X': 'Play1 X'),
        style: TextStyle(
          fontSize: 30,
      ),
        textAlign: TextAlign.center,
      ),
      actions: [
        continuaButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogOwin(BuildContext context) {

    Widget continuaButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        Navigator.of(context).pop();
        for(int i=0;i<9;i++){
          setState(() {
            lista[i] = null;
            lt2[i] = null;
          });
        }
        setState(() {
          jogadas = 0;
          empate =false;
          xwin = false;
          owin = false;
        });
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Congratulations you won"),
      content: Text((this.widget.nameP2!=null? '${this.widget.nameP2} O': 'Play2 O'),
        style: TextStyle(
            fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        continuaButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogAtie(BuildContext context) {

    Widget continuaButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        Navigator.of(context).pop();
        for(int i=0;i<9;i++){
          setState(() {
            lista[i] = null;
            lt2[i] = null;
          });
        }
        setState(() {
          jogadas = 0;
          empate =false;
          xwin = false;
          owin = false;
        });
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Nobody won"),
      content: Icon(Icons.insert_emoticon,size: 60),
      actions: [
        continuaButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
                              (this.widget.nameP1 == null?'Play 1': '${this.widget.nameP1}'),
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
                              (this.widget.nameP2 == null?'Play 2': '${this.widget.nameP2}'),
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

                  //print(jogadas);

                  //print(lista[0]);
                 // print(lt2);

                 // print(empate);

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[0]==null ? '' :'${lt2[0]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[1]==null? '' :'${lt2[1]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[2]==null? '' :'${lt2[2]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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


                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[3]==null? '' :'${lt2[3]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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


                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[4]==null? '' :'${lt2[4]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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


                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[5]==null? '' :'${lt2[5]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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


                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[6]==null? '' :'${lt2[6]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[7]==null? '' :'${lt2[7]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text(
                  (lt2[8]==null? '' :'${lt2[8]}'),
                  style: TextStyle(
                    fontSize: 40,
                  ),
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
