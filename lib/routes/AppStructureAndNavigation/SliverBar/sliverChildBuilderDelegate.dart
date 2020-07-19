import 'package:flutter/material.dart';

class SliverChildBuilderDelegatePage extends StatefulWidget {
  SliverChildBuilderDelegatePage({Key key}) : super(key: key);

  @override
  _SliverChildBuilderDelegateState createState() =>
      _SliverChildBuilderDelegateState();
}

class _SliverChildBuilderDelegateState
    extends State<SliverChildBuilderDelegatePage> {
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
              title: Text('SliverAnimatedOpacity'),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.indigo[100 * (index % 6) + 100],
                );
              },
              childCount: 4,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.blue[100 * (index % 6) + 100],
                );
              },
              childCount: 4,
              addAutomaticKeepAlives: true,
              addSemanticIndexes: true,
              addRepaintBoundaries: true,
              semanticIndexOffset: 10,
            ),
          ),
        ],
      ),
    );
  }
}
