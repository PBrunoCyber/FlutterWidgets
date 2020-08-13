import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class CustomPaintPage extends StatefulWidget {
  @override
  _CustomPaintState createState() => _CustomPaintState();
}

class _CustomPaintState extends State<CustomPaintPage> {
  List<DrawingArea> points = [];
  Color _selectColor = Colors.black;
  double _strokeWidth = 5;

  void _showColorsSelect(BuildContext context) async {
    var color = await showCupertinoModalPopup(
      context: context,
      builder: (context) => ShowColorsSelect(),
    );
    setState(
      () => _selectColor = color == null ? Colors.black : color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Custom Paint",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _selectColor,
      ),
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(
              DrawingArea(
                points: details.localPosition,
                paint: Paint()
                  ..color = _selectColor
                  ..strokeWidth = _strokeWidth
                  ..strokeCap = StrokeCap.round,
              ),
            );
          });
        },
        onPanEnd: (details) {
          setState(() {
            points.add(null);
          });
        },
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: CustomPaint(
                painter: PaintPainter(
                  list: points,
                  color: _selectColor,
                  strokeWidth: _strokeWidth,
                ),
                child: Container(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: CupertinoSlider(
                      value: _strokeWidth,
                      min: 5.0,
                      max: 20,
                      activeColor: _selectColor,
                      divisions: 10,
                      onChanged: (value) {
                        setState(() => _strokeWidth = value);
                      },
                    ),
                  ),
                  Expanded(
                    child: Scaffold(
                      body: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CircleAvatar(
                          backgroundColor: _selectColor,
                          child: IconButton(
                            icon: Icon(
                              Icons.color_lens,
                              color: Colors.white,
                            ),
                            onPressed: () => _showColorsSelect(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Scaffold(
                      body: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CircleAvatar(
                          backgroundColor: _selectColor,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            splashColor: Colors.blue,
                            splashRadius: 0.1,
                            onPressed: () {
                              points.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawingArea {
  Offset points;
  Paint paint;

  DrawingArea({this.points, this.paint});
}

class ShowColorsSelect extends StatefulWidget {
  @override
  _ShowColorsSelectState createState() => _ShowColorsSelectState();
}

class _ShowColorsSelectState extends State<ShowColorsSelect>
    with SingleTickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation<Offset> _animation;
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.indigo,
    Colors.yellow[600],
    Colors.green,
    Colors.grey,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.purpleAccent
  ];

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 1,
          child: SlideTransition(
            position: _animation,
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: _colors.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).pop(_colors[index]),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundColor: _colors[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PaintPainter extends CustomPainter {
  final List<DrawingArea> list;
  final Color color;
  final double strokeWidth;

  PaintPainter({
    @required this.list,
    @required this.color,
    @required this.strokeWidth,
  });

  //Poligonos
  // final double sides;
  // final double radius;
  // final double radians;

  // PaintPainter(
  //     {@required this.sides, @required this.radians, @required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < list.length - 1; i++) {
      if (list[i] != null && list[i + 1] != null) {
        canvas.drawLine(list[i].points, list[i + 1].points, list[i].paint);
      } else if (list[i] != null && list[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [list[i].points], list[i].paint);
      }
    }

    //Poligonos
    // var path = Path();
    // var angle = (math.pi * 2) / sides;
    // Offset center = Offset(size.width / 2, size.height / 2);
    // Offset startPoint =
    //     Offset(radius * math.cos(radians), radius * math.sin(radians));
    // path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    // for (int i = 1; i <= sides + 1; i++) {
    //   double x = radius * math.cos(radians + angle * i) + center.dx;
    //   double y = radius * math.sin(radians + angle * i) + center.dy;
    //   path.lineTo(x, y);
    // }
    // canvas.drawPath(path, paint);

    //Circulo com o path
    // var path = Path();
    // path.addOval(Rect.fromCircle(
    //     center: Offset(size.width / 2, size.height / 2), radius: 100));
    // canvas.drawPath(path, paint);

    //Circulo com o canvas
    // Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, 100, paint);

    //Line
    // var path = Path();
    // path.moveTo(20, size.height / 2);
    // path.lineTo(size.width - 20, size.height / 2);

    //canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
