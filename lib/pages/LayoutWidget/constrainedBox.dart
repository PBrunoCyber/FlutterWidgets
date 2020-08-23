import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ConstrainedBoxPage extends StatefulWidget {
  @override
  _ConstrainedBoxState createState() => _ConstrainedBoxState();
}

class _ConstrainedBoxState extends State<ConstrainedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Constrained Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 200, minHeight: 5),
          child: CupertinoButton.filled(
            child: Text("Click me"),
            onPressed: () => print("Ok"),
          ),
        ),
      ),
    );
  }
}
