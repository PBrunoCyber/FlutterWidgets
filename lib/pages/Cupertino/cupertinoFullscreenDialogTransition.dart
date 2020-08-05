import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoFullscreenDialogTransitionPage extends StatefulWidget {
  @override
  _CupertinoFullscreenDialogTransitionState createState() =>
      _CupertinoFullscreenDialogTransitionState();
}

class _CupertinoFullscreenDialogTransitionState
    extends State<CupertinoFullscreenDialogTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Cupertino Screen Transition"),
          centerTitle: true,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton.filled(
            child: Text("Next Page Cupertino Transition"),
            onPressed: () => Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, _, __) {
                  return FullDialogPage();
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}

//Second Page
class FullDialogPage extends StatefulWidget {
  @override
  _FullDialogPageState createState() => _FullDialogPageState();
}

class _FullDialogPageState extends State<FullDialogPage>
    with TickerProviderStateMixin {
  AnimationController _primary, _secondary;
  Animation<double> _animationPrimary, _animationSecondary;

  @override
  void initState() {
    //Primaty
    _primary = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationPrimary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _primary, curve: Curves.easeOut));
    //Secondary
    _secondary =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationSecondary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _secondary, curve: Curves.easeOut));
    _primary.forward();
    super.initState();
  }

  @override
  void dispose() {
    _primary.dispose();
    _secondary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFullscreenDialogTransition(
      primaryRouteAnimation: _animationPrimary,
      secondaryRouteAnimation: _animationSecondary,
      linearTransition: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text("Testing"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _primary.reverse();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).pop();
              });
            },
          ),
        ),
      ),
    );
  }
}
