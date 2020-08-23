import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FittedBoxPage extends StatefulWidget {
  @override
  _FittedBoxState createState() => _FittedBoxState();
}

class _FittedBoxState extends State<FittedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Fitted Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          width: 400,
          height: 200,
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.contain,
            child: Image.network(
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png",
            ),
          ),
        ),
      ),
    );
  }
}
