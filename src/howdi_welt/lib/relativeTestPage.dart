import 'package:flutter/material.dart';

class RelativeTestPage extends StatefulWidget {
  RelativeTestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RelativeTestPageState createState() => _RelativeTestPageState();
}

class _RelativeTestPageState extends State<RelativeTestPage> {
  int _counter = 0;

  void _resetCounter() {
    setState(() {
      _counter = 0;
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
          'Relative Test Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
          key: ValueKey("theFirstColumn"),
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              key: ValueKey("rowContainingLiveButton"),
              children: <Widget>[
                Container(
                    child: Column(children: <Widget>[
                      Text("Row1: Live Taps"),
                      Text(
                        '$_counter',
                        key: ValueKey("tapCounter"),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      OutlineButton(
                          onPressed: _resetCounter,
                          child: Text("Reset Tap Counter")),
                      FlatButton(
                        onPressed: () {
                          _changeCount(1);
                        },
                        onLongPress: () {
                          _changeCount(10);
                        },
                        child: Text("FUT:+1 (tap), +10 (long tap)"),
                      ),
                      FlatButton(
                        key: ValueKey("flatButtonLive100"),
                        onPressed: () {
                          _changeCount(100);
                        },
                        child: Text("+100 (Find Ancestor - Live)"),
                      ),                      
                    ])),
                /**/
              ],
            ),
            Row(
              key: ValueKey("rowContainingDeadButton"),
              children: <Widget>[
                Container(
                    child: Column(children: <Widget>[
                      Text("Row2: DeadTaps"),
                      FlatButton(
                        onPressed: () {
                        },
                        onLongPress: () {
                        },
                        child: Text("FUT:+1 (tap), +10 (long tap)"),
                      ),
                    ])),
                /**/
              ],
            )            
          ]),
    );
  }
}
