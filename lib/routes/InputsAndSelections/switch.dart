import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<SwitchPage> {
  bool _sounds = false;
  bool _music = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('Switch'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sound',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _sounds,
                  onChanged: (value) {
                    setState(() {
                      this._sounds = value;
                      print(_sounds);
                    });
                  },
                  activeColor: Colors.indigo[900],
                  dragStartBehavior: DragStartBehavior.start,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  inactiveThumbColor: Colors.black,
                  activeTrackColor: Colors.indigo[100],
                  inactiveTrackColor: Colors.grey.withOpacity(0.6),
                  autofocus: true,
                  focusColor: Colors.red,
                  hoverColor: Colors.grey,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Music',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _music,
                  onChanged: (value) {
                    setState(() {
                      this._music = value;
                      print(_music);
                    });
                  },
                  activeColor: Colors.indigo[900],
                  dragStartBehavior: DragStartBehavior.start,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  inactiveThumbColor: Colors.black,
                  activeTrackColor: Colors.indigo[100],
                  inactiveTrackColor: Colors.grey.withOpacity(0.6),
                  autofocus: true,
                  focusColor: Colors.red,
                  hoverColor: Colors.grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
