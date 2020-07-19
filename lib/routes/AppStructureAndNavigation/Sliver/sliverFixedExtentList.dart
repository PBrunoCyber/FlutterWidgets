import 'package:flutter/material.dart';

class SliverFixedExtentListPage extends StatefulWidget {
  @override
  _SliverFixedExtentListState createState() => _SliverFixedExtentListState();
}

class _SliverFixedExtentListState extends State<SliverFixedExtentListPage> {
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
              title: Text('SliverFixedExtentList'),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.blue[100 * (index % 8) + 100],
                  child: Center(
                    child: Text(
                      'Index $index',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
            itemExtent: 300,
          ),
        ],
      ),
    );
  }
}
