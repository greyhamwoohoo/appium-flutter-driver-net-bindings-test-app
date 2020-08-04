import 'package:flutter/material.dart';

class FindersTestPage extends StatefulWidget {
  FindersTestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FindersTestPageState createState() => _FindersTestPageState();
}

class _FindersTestPageState extends State<FindersTestPage> {

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
            'Finders and Position Test Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: _resetCounter,
              child: Text("Reset Counter"),
            ),                   
            FlatButton(
              onPressed: () {
                _changeCount(-4);
              },
              child: Text("FUT: FlutterBy.Type (Increment -4)",
              ),
            ),            
            Text(
              'The counter is:',
            ),
            Text(
              '$_counter',
              key: ValueKey("counter"),
              style: Theme.of(context).textTheme.headline4,
            ),
            // Recommendation by flutter.dev is to use, at most, one FloatingActionButton per screen. Lets smash the system :)
            FloatingActionButton.extended(
              heroTag: "btn1",
              onPressed: () {
                _changeCount(1);
              },
              label: Text("FUT: FlutterBy.Text (Increment 1)"),
              icon: Icon(Icons.add)
            ),            
            FloatingActionButton.extended(
              heroTag: "btn2",
              onPressed: () {
                _changeCount(2);
              },
              key: ValueKey("FUT: FlutterBy.ValueKey (Increment 2)"),
              label: Text("FlutterBy.ValueKey (Increment 2)"),
              icon: Icon(Icons.add)
            ),
            FloatingActionButton.extended(
              heroTag: "btn3",
              onPressed: () {
                _changeCount(3);
              },
              label: Text("FlutterBy.Tooltip (Increment 3)"),
              tooltip: "FUT: FlutterBy.Tooltip (Increment 3)",
              icon: Icon(Icons.add)
            ),            
            Semantics (
              child: FloatingActionButton.extended(
              heroTag: "btn4",
              onPressed: () {
                _changeCount(4);
              },
                label: Text("FUT: FlutterBy.SemanticsLabel (Increment 4)"),
                icon: Icon(Icons.add)
              ),
              label: "A Semantic Label To Raise By 4",
            ),
          ],
        ),
      ));
  }
}
