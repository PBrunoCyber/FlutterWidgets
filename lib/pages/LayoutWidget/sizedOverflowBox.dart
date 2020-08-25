import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SizedOverflowBoxPage extends StatefulWidget {
  @override
  _SizedOverflowBoxState createState() => _SizedOverflowBoxState();
}

class _SizedOverflowBoxState extends State<SizedOverflowBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Sized Overflow Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedOverflowBox(
              size: Size(200, 200),
              alignment: Alignment.centerLeft,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
