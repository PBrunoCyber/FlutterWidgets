import 'package:flutter/material.dart';

class SliverListPage extends StatefulWidget {
  @override
  _SliverListState createState() => _SliverListState();
}

class _SliverListState extends State<SliverListPage> {
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
              title: Text(
                'SliverList',
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: (index % 2 == 0) ? 200 : 400,
                color: Colors.blue[100 * (index % 2) + 200],
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
