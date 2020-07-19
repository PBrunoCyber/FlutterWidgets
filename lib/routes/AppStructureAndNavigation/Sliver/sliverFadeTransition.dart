import 'package:flutter/material.dart';

class SliverFadeTransitionPage extends StatefulWidget {
  @override
  _SliverFadeTransitionState createState() => _SliverFadeTransitionState();
}

class _SliverFadeTransitionState extends State<SliverFadeTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 200,
            pinned: true,
            floating: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverFadeTransition'),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverFadeTransition(
            opacity: _animation,
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.blueAccent[100 * (index % 6) + 100],
                    child: Center(
                      child: Text(
                        'SliverFadeTransition',
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade100),
                      ),
                    ),
                  );
                },
                childCount: 4,
              ),
              itemExtent: 200,
            ),
          ),
        ],
      ),
    );
  }
}
