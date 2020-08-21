import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AspectRadioPage extends StatefulWidget {
  @override
  _AspectRadioState createState() => _AspectRadioState();
}

class _AspectRadioState extends State<AspectRadioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Aspect Radio"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
          ),
        ),
      ),
    );
  }
}
