import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OffstagePage extends StatefulWidget {
  @override
  _OffstageState createState() => _OffstageState();
}

class _OffstageState extends State<OffstagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Offstage"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Offstage(
              offstage: false,
              child: Container(
                color: Colors.grey,
                height: 120,
              ),
            ),
            Offstage(
              offstage: false,
              child: Container(
                color: Colors.grey.shade600,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
