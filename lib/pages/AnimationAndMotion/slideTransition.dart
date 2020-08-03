import 'package:flutter/material.dart';

class SlideTransitionPage extends StatefulWidget {
  @override
  _SlideTransitionState createState() => _SlideTransitionState();
}

class _SlideTransitionState extends State<SlideTransitionPage>
    with SingleTickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation _curve;
  bool _isForward = true;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _offsetAnimation =
        Tween<Offset>(begin: Offset(-2, -2), end: Offset.zero).animate(_curve);
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
        child: AppBar(title: Text("Slide Transition"), centerTitle: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              position: _offsetAnimation,
              transformHitTests: true,
              textDirection: TextDirection.rtl,
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
                _isForward ? _controller.forward() : _controller.reverse();
              },
              child: Text("Change Slide Transition"),
              borderSide: BorderSide(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
