import 'package:flutter/material.dart';

class AnimatedModalBarrierPage extends StatefulWidget {
  @override
  AnimatedModalBarrierState createState() => AnimatedModalBarrierState();
}

class AnimatedModalBarrierState extends State<AnimatedModalBarrierPage>
    with TickerProviderStateMixin {
  bool _dismissable = false;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Animated Modal Barrier"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: OutlineButton(
          borderSide: BorderSide(color: Colors.black),
          child: Text(
            "Open modal",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              _dismissable = !_dismissable;
            });
            Future.delayed(Duration(microseconds: 400), () {
              Navigator.of(context).push(ModalPageRoute(
                  page: _ModalPage(), dismissible: _dismissable));
            });
          },
        ),
      ),
    );
  }
}

class ModalPageRoute extends TransitionRoute {
  ModalPageRoute({@required this.page, @required this.dismissible});

  final Widget page;
  final bool dismissible;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(builder: _buildModalBarrier),
      OverlayEntry(builder: (context) => Center(child: page)),
    ];
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(seconds: 1);

  @override
  Duration get reverseTransitionDuration => Duration(milliseconds: 1);

  Widget _buildModalBarrier(BuildContext context) {
    return IgnorePointer(
      ignoring: animation.status == AnimationStatus.reverse ||
          animation.status == AnimationStatus.forward,
      child: AnimatedModalBarrier(
        dismissible: dismissible,
        color: animation.drive(
          ColorTween(begin: Colors.transparent, end: Colors.blue.withAlpha(80)),
        ),
      ),
    );
  }
}

class _ModalPage extends StatefulWidget {
  @override
  __ModalPageState createState() => __ModalPageState();
}

class __ModalPageState extends State<_ModalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Wrap(
        children: <Widget>[
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                          "Modal Opened!",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        )),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width - 80,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey[800],
                    child: Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
