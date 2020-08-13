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
      body: Container(
        height: 400,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: PathClipper(),
              child: Container(
                color: Colors.blue.shade200,
                height: 400,
              ),
            ),
          ],
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
        size.width / 6, size.height - 30, size.width / 4, size.height - 120);
    path.quadraticBezierTo(size.width / 3, size.height / 2 - 40,
        size.width / 2 + 60, size.height / 3);
    path.quadraticBezierTo(size.width, size.height / 4, size.width, 0);

    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(
    //     size.width / 5, size.height - 90, size.width / 2, size.height - 60);
    // path.quadraticBezierTo(
    //     size.width + 80, size.height, size.width, size.height / 5);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);

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
