import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewState createState() => _GridViewState();
}

class _GridViewState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Grid View Count"),
          centerTitle: true,
        ),
      ),
      body: GridView.count(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: true,
        addSemanticIndexes: true,
        semanticChildCount: 20,
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        dragStartBehavior: DragStartBehavior.start,
        padding: EdgeInsets.all(5),
        reverse: false,
        cacheExtent: 200,
        shrinkWrap: false,
        primary: true,
        children: <Widget>[
          Container(color: Colors.blue[50]),
          Container(color: Colors.blue[100]),
          Container(color: Colors.blue[200]),
          Container(color: Colors.blue[300]),
          Container(color: Colors.blue[400]),
          Container(color: Colors.blue[500]),
          Container(color: Colors.blue[600]),
          Container(color: Colors.blue[700]),
          Container(color: Colors.blue[800]),
          Container(color: Colors.blue[900]),
        ],
      ),
    );
  }
}
