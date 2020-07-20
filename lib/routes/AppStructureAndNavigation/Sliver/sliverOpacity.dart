import 'package:flutter/material.dart';

class SliverOpacityPage extends StatefulWidget {
  @override
  _SliverOpactiyState createState() => _SliverOpactiyState();
}

class _SliverOpactiyState extends State<SliverOpacityPage> {
  bool _visible = true;

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
              title: Text('SliverOffstage'),
              centerTitle: true,
            ),
          ),
          SliverOpacity(
            opacity: _visible ? 1.0 : 0.0,
            sliver: SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    color: Colors.blue[100 * (index % 8) + 100],
                  );
                }, childCount: 10),
                itemExtent: 200),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                  child: Text('OPACITY'),
                  onPressed: () {
                    setState(() {
                      _visible ? _visible = false : _visible = true;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
