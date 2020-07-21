import 'package:flutter/material.dart';

class LinearProgressIndicatorPage extends StatefulWidget {
  @override
  _LinearProgressIndicatorState createState() =>
      _LinearProgressIndicatorState();
}

class _LinearProgressIndicatorState extends State<LinearProgressIndicatorPage>
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
          title: Text("LinearProgressIndicator"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 20,
          child: LinearProgressIndicator(
            backgroundColor: Colors.transparent,
            valueColor: _colorTween,
            semanticsLabel: "Indicator",
            semanticsValue: "indicator",
          ),
        ),
      ),
    );
  }
}
