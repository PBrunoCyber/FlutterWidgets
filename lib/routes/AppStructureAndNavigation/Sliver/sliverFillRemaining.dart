import 'package:flutter/material.dart';

class SliverFillRemainingPage extends StatefulWidget {
  @override
  _SliverFillRemainingState createState() => _SliverFillRemainingState();
}

class _SliverFillRemainingState extends State<SliverFillRemainingPage> {
  @override
  Widget build(BuildContext context) {
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
              title: Text('SliverFadeTransition'),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[100],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150,
              color: Colors.indigo[100],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Container(
              color: Colors.indigo[200],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150,
              color: Colors.indigo[100],
            ),
          ),
        ],
      ),
    );
  }
}
