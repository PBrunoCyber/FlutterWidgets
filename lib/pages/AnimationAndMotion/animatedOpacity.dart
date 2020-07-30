import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityState createState() => _AnimatedOpacityState();
}

class _AnimatedOpacityState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

  _changeOpacity() {
    setState(() => _opacity = this._opacity == 0 ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Animated Opacity"), centerTitle: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 2),
              curve: Curves.easeInBack,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
                decoration: ShapeDecoration(
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Divider(
              height: 20,
              endIndent: 60,
              color: Colors.white,
              indent: 60,
            ),
            OutlineButton(
              onPressed: () {
                _changeOpacity();
              },
              child: Text("Change Opacity"),
              borderSide: BorderSide(color: Colors.black),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
