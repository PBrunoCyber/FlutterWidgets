import 'package:flutter/material.dart';

class RotationTransitionPage extends StatefulWidget {
  @override
  _RotationTransitionState createState() => _RotationTransitionState();
}

class _RotationTransitionState extends State<RotationTransitionPage>
    with SingleTickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation<double> _animation;
  Animation _curve;
  bool _isForward = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
    _animation = Tween<double>(begin: 0, end: 1).animate(_curve);
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Rotation Transition"),
          centerTitle: true,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: RotationTransition(
              turns: _animation,
              child: Container(height: 300, width: 300, child: FlutterLogo()),
            ),
          ),
          OutlineButton(
            onPressed: () {
              setState(() => _isForward = !_isForward);
              Future.delayed(Duration(microseconds: 400), () {
                _isForward ? _controller.reverse() : _controller.forward();
              });
            },
            borderSide: BorderSide(color: Colors.black),
            child: Text("Change Rotation"),
          ),
        ],
      )),
    );
  }
}
