import 'package:flutter/material.dart';

class SliverChildListDelegatePage extends StatefulWidget {
  SliverChildListDelegatePage({Key key}) : super(key: key);

  @override
  _SliverChildListDelegateState createState() =>
      _SliverChildListDelegateState();
}

class _SliverChildListDelegateState extends State<SliverChildListDelegatePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        cacheExtent: 200,
        anchor: 0.007,
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 200,
            pinned: true,
            floating: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverChildListDelegate'),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 2.0,
              ),
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.red[400],
                ),
                Container(
                  color: Colors.orange[400],
                ),
                Container(
                  color: Colors.orange[400],
                ),
                Container(
                  color: Colors.red[400],
                ),
              ])),
        ],
      ),
    );
  }
}
