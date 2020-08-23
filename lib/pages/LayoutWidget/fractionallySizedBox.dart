import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FractionallySizedBoxPage extends StatefulWidget {
  @override
  _FractionallySizedBoxState createState() => _FractionallySizedBoxState();
}

class _FractionallySizedBoxState extends State<FractionallySizedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Fractionally Sized Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.1,
          widthFactor: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
