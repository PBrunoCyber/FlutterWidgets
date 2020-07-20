import 'package:flutter/material.dart';

class SliverOffstagePage extends StatefulWidget {
  @override
  _SliverOffstageState createState() => _SliverOffstageState();
}

class _SliverOffstageState extends State<SliverOffstagePage> {
  bool _showSliver = false;

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
          SliverOffstage(
            offstage: _showSliver,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: (index % 2 == 0) ? 200 : 400,
                  color: Colors.blue[100 * (index % 2) + 200],
                );
              }, childCount: 10),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      (_showSliver) ? _showSliver = false : _showSliver = true;
                    });
                  },
                  child: Text('TESTING'),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
