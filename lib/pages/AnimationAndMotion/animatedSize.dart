import 'package:flutter/material.dart';

class AnimatedSizePage extends StatefulWidget {
  @override
  _AnimatedSizeState createState() => _AnimatedSizeState();
}

class _AnimatedSizeState extends State<AnimatedSizePage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  static Animation _animationWidth, _animationHeight;

  double _widht = 0, _height = 0;

  _changeSize(BuildContext context) {
    setState(() {
      _widht == 0
          ? _widht = 50
          : _widht == 50
              ? _widht = MediaQuery.of(context).size.width - 40
              : _widht = 50;
      _height == 0
          ? _height = 50
          : _height == 50 ? _height = 300 : _height = 50;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationWidth = Tween<double>(begin: 0.1, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _animationHeight = Tween<double>(begin: 0, end: 300).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.addListener(() {
      this.setState(() {});
    });
    _controller.forward();
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
          title: Text("Animated Size"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
              duration: Duration(seconds: 1),
              vsync: this,
              curve: _widht == 50 ? Curves.easeOutBack : Curves.decelerate,
              child: Container(
                width: _widht == 0
                    ? MediaQuery.of(context).size.width *
                            _animationWidth.value -
                        40
                    : _widht,
                height: _height == 0 ? _animationHeight.value : _height,
                child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.blueAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            Divider(height: 40, endIndent: 80, indent: 80),
            OutlineButton(
              child: Text("Change Size"),
              onPressed: () => _changeSize(context),
              borderSide: BorderSide(color: Colors.black),
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
