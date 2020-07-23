import 'package:flutter/material.dart';

class ToolTipsPage extends StatefulWidget {
  @override
  _ToolTipsState createState() => _ToolTipsState();
}

class _ToolTipsState extends State<ToolTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("ToolTip"),
          centerTitle: true,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Tooltip(
          message: "Imagem do mario",
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), shape: BoxShape.rectangle),
          height: 20,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(10),
          showDuration: Duration(seconds: 1),
          excludeFromSemantics: false,
          preferBelow: true,
          textStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          verticalOffset: 100,
          waitDuration: Duration(milliseconds: 400),
          child: Image.asset(
            'lib/assets/mario.png',
            height: 200,
            width: 250,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
