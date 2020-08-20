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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print("Ok");
              },
              child: Container(width: 200, height: 200, color: Colors.red[900]),
            ),
            IgnorePointer(
              child: GestureDetector(
                onTap: () {
                  print("Ok1");
                },
                child:
                    Container(width: 100, height: 100, color: Colors.red[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
