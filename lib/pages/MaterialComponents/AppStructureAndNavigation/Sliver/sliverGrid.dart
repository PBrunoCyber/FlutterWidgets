import 'package:flutter/material.dart';

class SliverGridPage extends StatefulWidget {
  @override
  _SliverGridState createState() => _SliverGridState();
}

class _SliverGridState extends State<SliverGridPage> {
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
              title: Text('Sliver Grid'),
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
              maxCrossAxisExtent: 400.0,
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
