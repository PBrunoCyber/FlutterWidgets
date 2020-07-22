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
          title: Text("Grid View"),
          centerTitle: true,
        ),
      ),
      body: GridView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: true,
          addSemanticIndexes: true,
          semanticChildCount: 20,
          padding: EdgeInsets.all(5),
          reverse: false,
          cacheExtent: 2000,
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
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350,
            childAspectRatio: 0.9,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          )),
    );
  }
}
