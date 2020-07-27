import 'package:flutter/material.dart';

class SliverSafeAreaPage extends StatefulWidget {
  @override
  _SliverSafeAreaState createState() => _SliverSafeAreaState();
}

class _SliverSafeAreaState extends State<SliverSafeAreaPage> {
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
              title: Text('SliverSafeArea'),
              centerTitle: true,
            ),
          ),
          SliverSafeArea(
            top: true,
            bottom: true,
            right: true,
            left: true,
            minimum: EdgeInsets.all(5),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Colors.blue[100 * (index % 9) + 100],
                );
              }, childCount: 16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
