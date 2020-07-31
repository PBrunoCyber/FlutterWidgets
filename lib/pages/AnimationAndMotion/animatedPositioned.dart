import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  @override
  _AnimatedPositionedState createState() => _AnimatedPositionedState();
}

class _AnimatedPositionedState extends State<AnimatedPositionedPage> {
  String _selected = "center";

  void _changePosition() {
    setState(() => _selected = _selected == "center"
        ? "top"
        : _selected == "top"
            ? "bottom"
            : _selected == "bottom"
                ? "left"
                : _selected == "left" ? "right" : "center");
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(title: Text("Animated Positioned"), centerTitle: true)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  height: 200,
                  width: _screenWidth,
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                curve: Curves.fastLinearToSlowEaseIn,
                top: _selected == "top" ||
                        _selected == "left" ||
                        _selected == "right"
                    ? 0
                    : _selected == "bottom" ? 150 : 75,
                left: _selected == "top" ||
                        _selected == "bottom" ||
                        _selected == "left"
                    ? 0
                    : _selected == "right" ? _screenWidth - 50 : 50,
                height: _selected == "left" || _selected == "right" ? 200 : 50,
                width: _selected == "top" || _selected == "bottom"
                    ? _screenWidth
                    : _selected == "left" || _selected == "right"
                        ? 50
                        : _screenWidth - 100,
                child: Container(
                  width: _screenWidth - 100,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _selected.toUpperCase(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(height: 40, endIndent: 80, indent: 80),
          OutlineButton(
            child: Text("Change Position"),
            onPressed: _changePosition,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
          ),
        ],
      )),
    );
  }
}
