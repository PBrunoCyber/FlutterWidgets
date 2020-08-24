import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IntrinsicWidthPage extends StatefulWidget {
  @override
  _IntrinsicWidthState createState() => _IntrinsicWidthState();
}

class _IntrinsicWidthState extends State<IntrinsicWidthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Intrinsic Width"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.3,
          widthFactor: 0.95,
          child: IntrinsicWidth(
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.grey.shade300,
              child: Container(
                height: 100,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
