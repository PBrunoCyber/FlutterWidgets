import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IgnorePointerPage extends StatefulWidget {
  @override
  _IgnorePointerState createState() => _IgnorePointerState();
}

class _IgnorePointerState extends State<IgnorePointerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Ignore Pointer"),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
