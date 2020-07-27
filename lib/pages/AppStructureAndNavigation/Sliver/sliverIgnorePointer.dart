import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverIgnorePointerPage extends StatefulWidget {
  @override
  _SliverIgnorePointerState createState() => _SliverIgnorePointerState();
}

class _SliverIgnorePointerState extends State<SliverIgnorePointerPage> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height - 50;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 200,
            pinned: true,
            floating: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver Ignore Pointer',
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverIgnorePointer(
            ignoring: true,
            ignoringSemantics: true,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: _screenHeight,
                  color: Colors.indigo[100 * (index % 9) + 100],
                );
              }, childCount: 20),
            ),
          ),
        ],
      ),
    );
  }
}
