import 'package:flutter/material.dart';

class ScaleTransitionPage extends StatefulWidget {
  @override
  _ScaleTransitionState createState() => _ScaleTransitionState();
}

class _ScaleTransitionState extends State<ScaleTransitionPage>
    with SingleTickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation _animation, _curve;
  bool _isForward = true;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_curve);
    _controller.forward();
    super.initState();
  }

  Map<int, Color> _color = {
    50: Color.fromRGBO(33, 33, 33, .1),
    100: Color.fromRGBO(33, 33, 33, .2),
    200: Color.fromRGBO(33, 33, 33, .3),
    300: Color.fromRGBO(33, 33, 33, .4),
    400: Color.fromRGBO(33, 33, 33, .5),
    500: Color.fromRGBO(33, 33, 33, .6),
    600: Color.fromRGBO(33, 33, 33, .7),
    700: Color.fromRGBO(33, 33, 33, .8),
    800: Color.fromRGBO(33, 33, 33, .9),
    900: Color.fromRGBO(33, 33, 33, 1),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Scale Transition"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _animation,
              alignment: Alignment.topLeft,
              child: Container(
                height: 300,
                width: 300,
                child: FlutterLogo(
                  colors: MaterialColor(0xFF212121, _color),
                ),
              ),
            ),
            OutlineButton(
              onPressed: () {
                setState(() => _isForward = !_isForward);
                Future.delayed(Duration(microseconds: 400), () {
                  _isForward ? _controller.forward() : _controller.reverse();
                });
              },
              borderSide: BorderSide(color: Colors.black),
              child: Text("Change Scale"),
            ),
          ],
        ),
      ),
    );
  }
}
