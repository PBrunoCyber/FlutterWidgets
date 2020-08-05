import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageScaffoldPage extends StatefulWidget {
  @override
  _CupertinoPageScaffoldState createState() => _CupertinoPageScaffoldState();
}

class _CupertinoPageScaffoldState extends State<CupertinoPageScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
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
        backgroundColor: Colors.grey.shade100,
        actionsForegroundColor: Colors.black,
        brightness: Brightness.light,
        transitionBetweenRoutes: false,
        heroTag: 'a',
        previousPageTitle: "I don't Know",
        padding: EdgeInsetsDirectional.fromSTEB(10, 00, 20, 00),
      ),
      child: Center(
        child: Text(
          "Testing Cupertino Page Scaffold",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
