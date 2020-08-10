import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderState createState() => _StreamBuilderState();
}

class _StreamBuilderState extends State<StreamBuilderPage> {
  int _counter = 0;
  StreamController<int> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
    _streamController.add(0);
  }

  void _incrementCounter() {
    _counter++;
    _streamController.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Stream Builder"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            StreamBuilder(
              stream: _streamController.stream,
              builder: (BuildContext context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: CupertinoButton.filled(
                child: Text("Increment"),
                onPressed: _incrementCounter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
