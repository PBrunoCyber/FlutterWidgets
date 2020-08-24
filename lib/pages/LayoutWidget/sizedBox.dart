import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SizedBoxPage extends StatefulWidget {
  @override
  _SizedBoxState createState() => _SizedBoxState();
}

class _SizedBoxState extends State<SizedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Sized Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: SizedBox(
          width: 400.0,
          height: 100.0,
          child: Card(
            child: Align(
              alignment: Alignment.center,
              child: Text('Hello World!'),
            ),
          ),
        ),
      ),
    );
  }
}
