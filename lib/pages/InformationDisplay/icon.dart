import 'package:flutter/material.dart';

class IconPage extends StatefulWidget {
  @override
  _IconState createState() => _IconState();
}

class _IconState extends State<IconPage> {
  List<Icon> icons = [
    Icon(Icons.close,
        size: 200,
        color: Colors.indigo[900],
        semanticLabel: "close",
        textDirection: TextDirection.ltr),
    Icon(Icons.remove,
        size: 200,
        color: Colors.indigo[900],
        semanticLabel: "remove",
        textDirection: TextDirection.ltr),
    Icon(Icons.access_alarm,
        size: 200,
        color: Colors.indigo[900],
        semanticLabel: "access_alarm",
        textDirection: TextDirection.ltr),
    Icon(Icons.accessibility,
        size: 200,
        color: Colors.indigo[900],
        semanticLabel: "accessibility",
        textDirection: TextDirection.ltr),
    Icon(Icons.cached,
        size: 200,
        color: Colors.indigo[900],
        semanticLabel: "cached",
        textDirection: TextDirection.ltr),
    Icon(Icons.add,
        size: 200,
        color: Colors.indigo[900],
        semanticLabel: "add",
        textDirection: TextDirection.ltr),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Icon"),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: icons.map((e) => e).toList(),
          ),
        ),
      ),
    );
  }
}
