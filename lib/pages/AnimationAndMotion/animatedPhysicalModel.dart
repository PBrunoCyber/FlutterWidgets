import 'package:flutter/material.dart';

class AnimatedPhysicalModelPage extends StatefulWidget {
  @override
  _AnimatedPhysicalModelState createState() => _AnimatedPhysicalModelState();
}

class _AnimatedPhysicalModelState extends State<AnimatedPhysicalModelPage> {
  bool _change = false;

  _changePhysicalModel() {
    setState(() => _change = !this._change);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child:
            AppBar(title: Text("Animated Physical Model"), centerTitle: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              shape: BoxShape.rectangle,
              clipBehavior: Clip.hardEdge,
              elevation: _change ? 20 : 0,
              color: _change ? Colors.blue[900] : Colors.blue[400],
              shadowColor: Colors.black,
              borderRadius: _change
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(0),
              animateColor: true,
              animateShadowColor: true,
              curve: Curves.decelerate,
              duration: Duration(seconds: 1),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
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
                _changePhysicalModel();
              },
              child: Text("Change Physical Model"),
              borderSide: BorderSide(color: Colors.black),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
