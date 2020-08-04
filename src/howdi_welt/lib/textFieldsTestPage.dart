import 'package:flutter/material.dart';

class TextFieldsTestPage extends StatefulWidget {
  TextFieldsTestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TextFieldsTestPageState createState() => _TextFieldsTestPageState();
}

class _TextFieldsTestPageState extends State<TextFieldsTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            key: Key('backToHomePage'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Text Fields Test Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter some text'
              ),
            ),
          ],
        ),
      ));
  }
}

