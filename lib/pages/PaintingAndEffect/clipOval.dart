import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ClipOvalPage extends StatefulWidget {
  @override
  _ClipOvalState createState() => _ClipOvalState();
}

class _ClipOvalState extends State<ClipOvalPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Clip Oval"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: ClipOval(
          clipper: ImageClipper(),
          child: Image.network(
            "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
            height: 300,
            width: 400,
          ),
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(65, 0, 270, 270);
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
