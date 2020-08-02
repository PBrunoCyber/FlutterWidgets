import 'package:flutter/material.dart';

class PositionedTransitionPage extends StatefulWidget {
  @override
  _PositionedTransitionState createState() => _PositionedTransitionState();
}

class _PositionedTransitionState extends State<PositionedTransitionPage>
    with SingleTickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation<RelativeRect> _animation;
  Animation _curve;
  bool _isForward = true;
  // RelativeRect _animationValue;
  // AnimationStatus _state;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 450, 800),
      end: RelativeRect.fromLTRB(0, 0, 0, 100),
    ).animate(_curve);
    // ..addListener(
    //   () => setState(() => _animationValue = _animation.value),
    // )
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidht = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Positioned Transition"), centerTitle: true),
      ),
      body: Stack(
        children: <Widget>[
          AnimatorTransition(
            child: Image(
              height: _screenWidht,
              width: _screenWidht,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                  value: (loadingProgress != null)
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                );
              },
              image: NetworkImage(
                'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
              ),
            ),
            animation: _animation,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 400),
              child: OutlineButton(
                onPressed: () {
                  setState(() => _isForward = !_isForward);
                  Future.delayed(Duration(microseconds: 400), () {
                    _isForward ? _controller.forward() : _controller.reverse();
                  });
                },
                child: Text("Change PositionedTransition"),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatorTransition extends StatelessWidget {
  final Widget child;
  final Animation<RelativeRect> animation;
  const AnimatorTransition(
      {Key key, @required this.child, @required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedTransition(rect: this.animation, child: this.child),
      ],
    );
  }
}
