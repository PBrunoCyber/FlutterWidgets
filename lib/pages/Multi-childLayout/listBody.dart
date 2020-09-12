import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListBodyPage extends StatefulWidget {
  @override
  _ListBodyState createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("List Body"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: [
          ListBody(
            mainAxis: Axis.vertical,
            children: [
              for (var i = 0; i < 5; i++)
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
