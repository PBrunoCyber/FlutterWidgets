import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RotatedBoxPage extends StatefulWidget {
  @override
  _RotatedBoxState createState() => _RotatedBoxState();
}

class _RotatedBoxState extends State<RotatedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Rotated Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: RotatedBox(
          quarterTurns: 2,
          child: Image.network(
            "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
          ),
        ),
      ),
    );
  }
}
