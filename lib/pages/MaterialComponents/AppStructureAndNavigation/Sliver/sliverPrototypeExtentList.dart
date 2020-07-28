import 'package:flutter/material.dart';

class SliverPrototypeEntentListPage extends StatefulWidget {
  @override
  _SliverPrototypeEntentListState createState() =>
      _SliverPrototypeEntentListState();
}

class _SliverPrototypeEntentListState
    extends State<SliverPrototypeEntentListPage> {
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
              title: Text('SliverPrototypeExtentList'),
              centerTitle: true,
            ),
          ),
          SliverPrototypeExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  child: Image.network(
                      'https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg'),
                  color: Colors.blue[100 * (index % 9) + 100],
                );
              }, childCount: 20),
              prototypeItem: Image.network(
                'https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg',
              ))
        ],
      ),
    );
  }
}
