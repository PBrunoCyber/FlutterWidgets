import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderState createState() => _AnimatedBuilderState();
}

class _AnimatedBuilderState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static double _value = 0.0;
  double _result = _value.toDouble();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller.value = 1;
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
          title: Text("Animated Builder"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              color: Colors.indigo[50],
              padding: EdgeInsets.all(10),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _controller.value * _result,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.indigo[900],
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 30,
            ),
            Slider.adaptive(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  _result = value.toDouble();
                });
              },
              min: 0,
              max: 4,
              divisions: 100,
              label: _result.toString(),
              activeColor: Colors.indigo[900],
              inactiveColor: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}
