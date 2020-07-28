import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignState createState() => _AnimatedAlignState();
}

class _AnimatedAlignState extends State<AnimatedAlignPage> {
  AlignmentGeometry _alignment = Alignment.center;

  void _changeAlign() {
    setState(() {
      _alignment = _alignment == Alignment.center
          ? _alignment = Alignment.topCenter
          : (_alignment == Alignment.topCenter)
              ? _alignment = Alignment.bottomCenter
              : _alignment = Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Animated Align"),
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
              child: AnimatedAlign(
                alignment: _alignment,
                duration: Duration(seconds: 1),
                curve: Curves.elasticOut,
                onEnd: () => print("Terminou!"),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.indigo[900],
                ),
              ),
            ),
            RaisedButton(
              child: Text("Mudar alinhamento"),
              onPressed: _changeAlign,
              color: Colors.indigo[50],
              splashColor: Colors.indigo[900],
            ),
          ],
        ),
      ),
    );
  }
}
