import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlignPage extends StatefulWidget {
  @override
  _AlignState createState() => _AlignState();
}

class _AlignState extends State<AlignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Align"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          color: Colors.grey.shade200,
          child: Align(
            alignment: Alignment(-0.5, 0),
            child: Text("Align", style: Theme.of(context).textTheme.headline6),
          ),
        ),
      ),
    );
  }
}
