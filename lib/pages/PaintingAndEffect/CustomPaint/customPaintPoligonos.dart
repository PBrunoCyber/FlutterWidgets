import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class CustomPaintPoligonosPage extends StatefulWidget {
  @override
  _CustomPaintPoligonosState createState() => _CustomPaintPoligonosState();
}

class _CustomPaintPoligonosState extends State<CustomPaintPoligonosPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CustomPaint Poligonos"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: CustomPaint(
        painter: PaintPoligonos(sides: 5, radians: 0, radius: 150),
        child: Container(),
      ),
    );
  }
}

class PaintPoligonos extends CustomPainter {
  final double sides;
  final double radians;
  final double radius;

  PaintPoligonos(
      {@required this.sides, @required this.radians, @required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var angle = (math.pi * 2) / sides;

    var center = Offset(size.width / 2, size.height / 2);
    var startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));
    var path = Path();

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 0; i <= sides + 1; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(oldPaint) {
    return false;
  }
}
