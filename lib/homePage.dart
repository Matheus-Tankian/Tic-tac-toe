

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
      body: ListView(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        children: <Widget>[
          Container(
            height: (aux? (heightSize): 300),
            color: Colors.red,

          )
        ],
      )
    );
  }
  Widget MainView(){
    return Column(
      children: <Widget>[

      ],
    )

  }
}
