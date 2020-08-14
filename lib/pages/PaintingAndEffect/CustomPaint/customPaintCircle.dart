import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomPaintCircle extends StatefulWidget {
  @override
  _CustomPaintCircleState createState() => _CustomPaintCircleState();
}

class _CustomPaintCircleState extends State<CustomPaintCircle> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CustomPaint Circle"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: CustomPaint(
        painter: PaintCircle(),
        child: Container(),
      ),
    );
  }
}

class PaintCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);

    //Circulo com o path
    // var path = Path();
    // path.addOval(Rect.fromCircle(
    //     center: Offset(size.width / 2, size.height / 2), radius: 100));
    // canvas.drawPath(path, paint);

    //Circulo com o canvas
    // Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(oldPaint) {
    return false;
  }
}
