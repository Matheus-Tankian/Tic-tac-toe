

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settingsPage.dart';

class HomePage extends StatelessWidget {
  var num = 0;
  bool aux = true;



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
              height: (aux? (heightSize): 300),
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
            color: Colors.indigo,
          ),
          flex: 4,
        ),

      ],
    );

  }
}
