import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerState createState() => _ContainerState();
}

class _ContainerState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Container"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxHeight: 200, maxWidth: 300),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          child: CupertinoButton.filled(
            child: Text("Hello World"),
            onPressed: () => print("OK"),
          ),
          padding: EdgeInsets.only(bottom: 100),
        ),
      ),
    );
  }
}
