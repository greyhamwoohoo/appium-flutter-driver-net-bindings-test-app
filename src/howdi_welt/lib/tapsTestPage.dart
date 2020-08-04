import 'package:flutter/material.dart';

class TapsTestPage extends StatefulWidget {
  TapsTestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TapsTestPageState createState() => _TapsTestPageState();
}

class _TapsTestPageState extends State<TapsTestPage> {

  int _counter = 0;

  void _resetCounter() {
    setState(() {
      _counter=0;
    });
  }      

  void _changeCount(int amount) {
    setState(() {
      _counter += amount;
    });
  }

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
            'Taps Test Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Taps Page"),
              Text(
                '$_counter',
                key: ValueKey("tapCounter"),
                style: Theme.of(context).textTheme.headline4,
              ),              
              OutlineButton(
                onPressed: _resetCounter,
                child: Text("Reset Tap Counter"),
              ),                   
              FlatButton(
                onPressed: () {
                  _changeCount(1);
                },
                onLongPress: () {
                  _changeCount(10);
                },
                child: Text("FUT:+1 (tap), +10 (long tap)"),
                ),
            ],
          ),
      ));
  }
}
