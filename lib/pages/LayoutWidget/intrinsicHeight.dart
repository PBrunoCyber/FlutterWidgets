import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IntrinsicHeightPage extends StatefulWidget {
  @override
  _IntrinsicHeightState createState() => _IntrinsicHeightState();
}

class _IntrinsicHeightState extends State<IntrinsicHeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Intrinsic Height"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
          child: FractionallySizedBox(
        heightFactor: 0.2,
        widthFactor: 0.95,
        child: IntrinsicHeight(
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.grey.shade200,
            child: Container(
              width: 100,
              color: Colors.grey,
            ),
          ),
        ),
      )),
    );
  }
}
