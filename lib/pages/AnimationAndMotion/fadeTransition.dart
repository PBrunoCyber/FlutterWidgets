import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  @override
  createState() => _FadeTransitionState();
}

class _FadeTransitionState extends State<FadeTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool _isForward = true;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Fade Transition"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: _animation,
              child: Container(
                height: 200,
                width: 200,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: FlutterLogo(),
              ),
            ),
            Divider(color: Colors.transparent, height: 20),
            OutlineButton(
              onPressed: () {
                setState(() => _isForward = !_isForward);
                Future.delayed(Duration(microseconds: 500), () {
                  (_isForward) ? _controller.forward() : _controller.reverse();
                });
              },
              borderSide: BorderSide(color: Colors.blue[900]),
              child: Text("Change Fade Transition"),
              textColor: Colors.blue[900],
            )
          ],
        ),
      ),
    );
  }
}
