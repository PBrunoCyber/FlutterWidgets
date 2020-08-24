import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OverflowBoxPage extends StatefulWidget {
  @override
  _OverflowBoxState createState() => _OverflowBoxState();
}

class _OverflowBoxState extends State<OverflowBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Overflow Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Container(
          width: 50,
          height: 400,
          color: Colors.grey,
          child: OverflowBox(
            alignment: Alignment.topCenter,
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: 400,
            minHeight: 0,
            minWidth: 0,
            child: Container(
              width: 250,
              height: 50,
              color: Colors.grey.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
