import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class DecoratedBoxPage extends StatefulWidget {
  @override
  _DecoratedBoxState createState() => _DecoratedBoxState();
}

class _DecoratedBoxState extends State<DecoratedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Decorated Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            /// This is an interface that allows [LinearGradient], [RadialGradient], and
            /// [SweepGradient] classes to be used interchangeably in [BoxDecoration]s
            gradient: LinearGradient(
              colors: [Colors.grey.shade300, Colors.grey.shade500],
              stops: [0.4, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // transform: TransformGradient(radians: 1)
            ),
          ),
          position: DecorationPosition.background,
          child: Container(
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}

class TransformGradient extends GradientTransform {
  final double radians;
  TransformGradient({@required this.radians});

  @override
  Matrix4 transform(Rect bounds, {TextDirection textDirection}) {
    final double sinRadius = math.sin(radians);
    final double cosRadius = 1 - math.cos(radians);
    final Offset center = bounds.center;
    final double rotateX = sinRadius * center.dy + cosRadius * center.dx;
    final double rotateY = -sinRadius * center.dx + cosRadius * center.dy;

    return Matrix4.identity()
      ..translate(rotateX, rotateY)
      ..rotateZ(radians);
  }
}
