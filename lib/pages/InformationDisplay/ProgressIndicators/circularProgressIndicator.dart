import 'package:flutter/material.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  @override
  _CircularProgressIndicatorState createState() =>
      _CircularProgressIndicatorState();
}

class _CircularProgressIndicatorState
    extends State<CircularProgressIndicatorPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.indigo[900], end: Colors.indigo[200]));

    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text("CircularProgressIndicator"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            valueColor: _colorTween,
            semanticsLabel: "Indicator",
            semanticsValue: "indicator",
          ),
        ),
      ),
    );
  }
}
