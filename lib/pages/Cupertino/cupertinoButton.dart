import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoButtonPage extends StatefulWidget {
  @override
  _CupertinoButtonState createState() => _CupertinoButtonState();
}

class _CupertinoButtonState extends State<CupertinoButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Cupertino Button"), centerTitle: true),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton.filled(
              borderRadius: BorderRadius.circular(10),
              minSize: 20,
              padding: EdgeInsets.all(15),
              pressedOpacity: 0.5,
              disabledColor: Colors.grey.shade100,
              child: Text("I agree!"),
              onPressed: () => print("Ok!"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(10),
                minSize: 20,
                color: Colors.red,
                padding: EdgeInsets.all(15),
                pressedOpacity: 0.5,
                disabledColor: Colors.grey.shade100,
                child: Text("Cancel", style: TextStyle(color: Colors.red)),
                onPressed: () => print("Ok!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
