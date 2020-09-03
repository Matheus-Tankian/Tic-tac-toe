
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
  String dataO = 'O';

  bool click = false;

  void primeiro(){
    setState(() {
      jogadas = jogadas + 1;
    });
  }

  void funClick(){
   if(jogadas %2 ==1){
     setState(() {
       click = !click;
       data = 'X';
     });
   }
  }






  @override

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var widthSize = MediaQuery.of(context).size.width;
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
                  debugPrint('I am Awesome');
                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                highlightColor: Colors.orangeAccent,
                child: Text('Flat Button'),
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

                  primeiro();
                  funClick();

                  print(jogadas);
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
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.white,
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.greenAccent,
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
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.white,
          ),
          flex: 2,
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 4.0,right: 8.0),
            color: Colors.greenAccent,
          ),
          flex: 2,
        ),

      ],
    );
  }


}

