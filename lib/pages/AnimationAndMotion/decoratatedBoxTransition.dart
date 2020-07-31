import 'package:flutter/material.dart';

class DecoratedBoxTransitionPage extends StatefulWidget {
  @override
  _DecoratedBoxTransitionState createState() => _DecoratedBoxTransitionState();
}

class _DecoratedBoxTransitionState extends State<DecoratedBoxTransitionPage>
    with TickerProviderStateMixin {
  bool _isActive = false;

  Map<int, Color> colorCodes = {
    50: Color.fromRGBO(26, 35, 126, .1),
    100: Color.fromRGBO(26, 35, 126, .2),
    200: Color.fromRGBO(26, 35, 126, .3),
    300: Color.fromRGBO(26, 35, 126, .4),
    400: Color.fromRGBO(26, 35, 126, .5),
    500: Color.fromRGBO(26, 35, 126, .6),
    600: Color.fromRGBO(26, 35, 126, .7),
    700: Color.fromRGBO(26, 35, 126, .8),
    800: Color.fromRGBO(26, 35, 126, .9),
    900: Color.fromRGBO(26, 35, 126, 1),
  };

  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      border: Border.all(width: 1, color: Colors.indigo[400]),
      color: Colors.white,
      borderRadius: BorderRadius.zero,
      boxShadow: <BoxShadow>[
        BoxShadow(blurRadius: 10, spreadRadius: 6, color: Colors.indigo[200]),
      ],
    ),
    end: BoxDecoration(
      border: Border.all(width: 0, color: Colors.black),
      color: Colors.indigo[400],
      borderRadius: BorderRadius.circular(20),
    ),
  );

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Decorated Box Transition"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBoxTransition(
              decoration: _decorationTween.animate(_controller),
              position: DecorationPosition.background,
              child: Container(
                height: 200,
                width: 200,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: FlutterLogo(
                        colors: MaterialColor(0xFF9FA8DA, colorCodes))),
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 40,
            ),
            OutlineButton(
              child: Text("Change BoxDecoration"),
              onPressed: () {
                setState(() {
                  this._isActive = !_isActive;
                });
                (_isActive) ? _controller.forward() : _controller.reverse();
              },
              borderSide: BorderSide(color: Colors.black),
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
