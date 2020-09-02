import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool auxHeight = true;
  String namePlay1 = 'Play1';
  String namePlay2 = 'Play2';


  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: <Widget>[
          Container(
            height: (auxHeight? (heightSize -90):100),
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: titleView(),
                  flex: 1,
                ),

                Expanded(
                  child: Container(
                    color: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPlay1View(),
                  ),
                  flex: 1,
                ),

                Expanded(

                  child: Container(
                    color: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPlay2View(),
                  ),
                  flex: 1,
                ),

                Expanded(

                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      height: 80,
                      child: buttonView(),
                    ),
                  ),
                  flex: 4,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget titleView(){
    return Container(
      child: Center(
        child: Text(
          'Iforme os dados',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget textPlay1View(){
    return TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'name play 1',
        ),
        onChanged: (text){
          var aux  = text;
          if(aux !=null){
            setState(() {
              namePlay1 = aux;
            });
          }
        }
    );
  }

  Widget textPlay2View(){
    return TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'name play 2',
        ),
        onChanged: (text){
          var aux  = text;
          if(aux !=null){
            setState(() {
              namePlay2 = aux;
            });
          }
        }
    );
  }

  Widget buttonView(){
    return FlatButton(

      onPressed: () {

      },
      textColor: Colors.white,
      color: Colors.blueAccent,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      highlightColor: Colors.orangeAccent,
      child: Text(
          'Send',
          style: TextStyle(
          fontSize: 20,
      ),
      ),
    );
  }

}






