import 'package:flutter/material.dart';

class SliverOverlapAbsorberPage extends StatefulWidget {
  @override
  _SliverOverlapAbsorberState createState() => _SliverOverlapAbsorberState();
}

class _SliverOverlapAbsorberState extends State<SliverOverlapAbsorberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 200,
            backgroundColor: Colors.blue[900],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverOverlapAbsorber'),
              centerTitle: true,
            ),
          ),
          SliverOverlapAbsorber(
            handle: SliverOverlapAbsorberHandle(),
            sliver: SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    color: Colors.blue[100 * (index % 8) + 100],
                  );
                }, childCount: 10),
                itemExtent: 200),
          ),
        ],
      ),
    );
  }
}
