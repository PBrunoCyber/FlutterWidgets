import 'package:flutter/material.dart';

class SliverGridDelegateWithMaxCrossAxisExtentPage extends StatefulWidget {
  @override
  _SliverGridDelegateWithMaxCrossAxisExtentState createState() =>
      _SliverGridDelegateWithMaxCrossAxisExtentState();
}

class _SliverGridDelegateWithMaxCrossAxisExtentState
    extends State<SliverGridDelegateWithMaxCrossAxisExtentPage> {
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
                'SliverGridDelegateMaxCrossAxisExtent',
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    color: Colors.blue[100 * (index % 9) + 100],
                  ));
            }, childCount: 15),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 1,
            ),
          )
        ],
      ),
    );
  }
}
