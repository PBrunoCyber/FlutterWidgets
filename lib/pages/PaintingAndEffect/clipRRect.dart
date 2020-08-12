import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ClipRRectPage extends StatefulWidget {
  @override
  _ClipRRectState createState() => _ClipRRectState();
}

class _ClipRRectState extends State<ClipRRectPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Clip RRect"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          clipper: RRectClipper(),
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

class RRectClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndCorners(
      Rect.fromLTWH(15, 0, 270, 270),
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
      bottomLeft: Radius.circular(0),
      bottomRight: Radius.circular(30),
    );
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
