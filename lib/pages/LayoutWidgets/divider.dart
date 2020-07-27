import 'package:flutter/material.dart';

class DividerPage extends StatefulWidget {
  @override
  _DividerState createState() => _DividerState();
}

class _DividerState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Divider"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(color: Colors.indigo[50], height: 200),
              Divider(
                color: Colors.indigo[900],
                endIndent: 0,
                indent: 0,
                height: 50,
                thickness: 2,
              ),
              Container(color: Colors.indigo[50], height: 200),
              Divider(
                color: Colors.indigo[900],
                endIndent: 0,
                indent: 0,
                height: 50,
                thickness: 2,
              ),
              Container(color: Colors.indigo[50], height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
