import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CenterPage extends StatefulWidget {
  @override
  _CenterState createState() => _CenterState();
}

class _CenterState extends State<CenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Center"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
