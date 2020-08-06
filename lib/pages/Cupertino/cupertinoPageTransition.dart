import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageTransitionPage extends StatefulWidget {
  @override
  _CupertinoPageTransitionState createState() =>
      _CupertinoPageTransitionState();
}

class _CupertinoPageTransitionState extends State<CupertinoPageTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Page Transition"),
        backgroundColor: Colors.grey.shade100,
      ),
      child: Center(
        child: CupertinoButton.filled(
          child: Text("Next Page"),
          onPressed: () {
            return Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return PageTranstion();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class PageTranstion extends StatefulWidget {
  @override
  _PageTranstionState createState() => _PageTranstionState();
}

class _PageTranstionState extends State<PageTranstion>
    with TickerProviderStateMixin {
  //Variables
  AnimationController _primary, _secondary;
  Animation<double> _animationPrimary, _animationSecondary;

  @override
  void initState() {
    _primary =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _secondary =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationPrimary = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _primary, curve: Curves.easeOutSine),
    );
    _animationSecondary = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _secondary, curve: Curves.easeOutSine),
    );
    _primary.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageTransition(
      primaryRouteAnimation: _animationPrimary,
      secondaryRouteAnimation: _animationSecondary,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.grey.shade100,
          middle: Text("Page Two Transition"),
          leading: GestureDetector(
            onTap: () {
              _primary.reverse();
              Future.delayed(Duration(milliseconds: 500), () {
                Navigator.of(context).pop();
              });
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        child: Center(
          child: Text(
            "Page Two Transition",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      linearTransition: true,
    );
  }
}
