import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaselinePage extends StatefulWidget {
  @override
  _BaselineState createState() => _BaselineState();
}

class _BaselineState extends State<BaselinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Baseline"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Baseline(
          baseline: -200,
          baselineType: TextBaseline.alphabetic,
          child: Text("Hello guys!"),
        ),
      ),
    );
  }
}
