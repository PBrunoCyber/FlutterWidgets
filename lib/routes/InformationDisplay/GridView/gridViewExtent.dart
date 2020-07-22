import 'package:flutter/material.dart';

class GridViewExtentPage extends StatefulWidget {
  @override
  _GridViewExtentState createState() => _GridViewExtentState();
}

class _GridViewExtentState extends State<GridViewExtentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Grid View Extent"),
          centerTitle: true,
        ),
      ),
      body: GridView.extent(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: true,
        addSemanticIndexes: true,
        semanticChildCount: 20,
        maxCrossAxisExtent: 350,
        childAspectRatio: 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        padding: EdgeInsets.all(5),
        reverse: false,
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
