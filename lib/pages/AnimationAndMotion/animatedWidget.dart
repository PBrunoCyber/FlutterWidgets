import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedWidgetClass extends AnimatedWidget {
  AnimatedWidgetClass({
    Key key,
    AnimationController controller,
    this.angle,
    this.infinite,
  }) : super(key: key, listenable: controller);

  final double angle;
  final bool infinite;

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: infinite ? _progress.value * 2.0 * math.pi : angle,
      child: Column(children: [
        FlutterLogo(size: 200),
      ]),
    );
  }
}

class AnimatedWidgetPage extends StatefulWidget {
  @override
  _AnimatedWidgetState createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidgetPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  double _angulo = 0;
  bool _infinite = true;

  void _changeRotate() {
    setState(() {
      _angulo += 0.1;
    });
  }

  void _infiniteChange() {
    setState(() => _infinite = !_infinite);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Animated Widget"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedWidgetClass(
              controller: _controller,
              angle: _angulo,
              infinite: _infinite,
            ),
            Divider(
              endIndent: 60,
              indent: 60,
              color: Colors.transparent,
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  child: Text("Change Rotate"),
                  onPressed: !_infinite ? _changeRotate : null,
                  borderSide: BorderSide(color: Colors.black),
                  textColor: Colors.black,
                ),
                OutlineButton(
                  child: Text("Infinite"),
                  onPressed: _infiniteChange,
                  borderSide: BorderSide(color: Colors.black),
                  textColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
