import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash/homePage.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
      ),
//      body: ListView(
//        padding: const EdgeInsets.symmetric(horizontal: 8),
//        children: <Widget>[
         body: Container(
            height: (auxHeight? (heightSize):100),
           color: Colors.indigo,
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

                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPlay1View(),
                  ),
                  flex: 1,
                ),

                Expanded(

                  child: Container(

                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPlay2View(),
                  ),
                  flex: 1,
                ),

                Expanded(

                  child: Align(
                    alignment: Alignment.topCenter,
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
        //],
     );
//    );
  }
  Widget titleView(){
    return Container(
      child: Center(
        child: Text(
          'Informe os dados',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget textPlay1View(){
    return TextField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        textInputAction: TextInputAction.send,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.white),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'name play 1',
          labelStyle: new TextStyle(
              color: Colors.white,
          ),
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
      cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        textInputAction: TextInputAction.send,
        decoration:
        InputDecoration(
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
        ),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'name play 2',
          labelStyle: new TextStyle(
              color:Colors.white,
          ),
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
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => HomePage(foo: namePlay1)
            ));
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






