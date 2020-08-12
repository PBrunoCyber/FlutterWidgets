import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ClipPathPage extends StatefulWidget {
  @override
  _ClipPathState createState() => _ClipPathState();
}

class _ClipPathState extends State<ClipPathPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: PathClipper(),
        child: Container(
          color: Colors.blue[900],
          height: 350,
          child: Center(
            child: Text(
              "Clip Path",
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
          ),
        ),
      ),
    );
  }
}

class PathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 5, size.height - 90, size.width / 2, size.height - 60);
    path.quadraticBezierTo(
        size.width + 80, size.height, size.width, size.height / 5);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height / 2, size.width, size.height);
    // path.lineTo(size.width, 0);

    // path.lineTo(0, size.height - 100);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height, size.width, size.height - 100);
    // path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
