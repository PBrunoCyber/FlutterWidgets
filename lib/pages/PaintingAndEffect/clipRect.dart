import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ClipRectPage extends StatefulWidget {
  @override
  _ClipRectState createState() => _ClipRectState();
}

class _ClipRectState extends State<ClipRectPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("ClipRect"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: ClipRect(
          clipper: RectClipper(),
          child: Image.network(
            "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }
}

class RectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(-20, -20, 250, 250);
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
