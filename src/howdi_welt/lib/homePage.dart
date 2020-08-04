import 'package:flutter/material.dart';
import './findersTestPage.dart';
import './textFieldsTestPage.dart';
import './tapsTestPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to the Test App"),
            OutlineButton(
              onPressed: () { 
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FindersTestPage()));                
              },
              child: Text("Navigate to Finders and Position Test Page")
            ),
            OutlineButton(
              onPressed: () { 
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TextFieldsTestPage()));                
              },
              child: Text("Navigate to Text Fields Test Page")
            ),
            OutlineButton(
              onPressed: () { 
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TapsTestPage()));                
              },
              child: Text("Navigate to Taps Test Page")
            ),            
          ],
        ),
      ),
    );
  }
}
