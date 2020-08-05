import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBarPage extends StatefulWidget {
  @override
  _CupertinoNavigationBarState createState() => _CupertinoNavigationBarState();
}

class _CupertinoNavigationBarState extends State<CupertinoNavigationBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Cupertino Navigation Bar"),
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
        ),
        trailing: Text(
          "Exit",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.grey.shade200,
        actionsForegroundColor: Colors.black,
        brightness: Brightness.light,
        transitionBetweenRoutes: false,
        heroTag: 'a',
        previousPageTitle: "I don't Know",
        padding: EdgeInsetsDirectional.fromSTEB(10, 00, 20, 00),
      ),
    );
  }
}
