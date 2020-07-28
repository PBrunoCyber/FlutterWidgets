import 'package:flutter/material.dart';

class IconButtonPage extends StatefulWidget {
  @override
  _IconButtonState createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButtonPage> {
  int _volume = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            title: Text(
              'Icon Button',
              style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Volume: $_volume',
              style: TextStyle(fontSize: 20, height: 2),
            ),
            Ink(
              decoration: ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.blue[900], width: 1))),
              child: IconButton(
                icon: Icon(Icons.volume_up),
                onPressed: () {
                  setState(() {
                    this._volume += 1;
                  });
                },
                iconSize: 35,
                alignment: Alignment.center,
                color: Colors.blue[900],
                constraints: BoxConstraints(minHeight: 70, minWidth: 70),
                hoverColor: Colors.blue[100],
                splashColor: Colors.indigo[50],
                tooltip: 'This is a icon button',
                disabledColor: Colors.grey.shade500,
                autofocus: true,
                focusColor: Colors.indigo[50],
                padding: EdgeInsets.all(5),
                enableFeedback: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                highlightColor: Colors.indigo[50],
              ),
            ),
          ],
        )));
  }
}
