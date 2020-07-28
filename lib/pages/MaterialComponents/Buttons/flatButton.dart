import 'package:flutter/material.dart';

class FlatButtonPage extends StatefulWidget {
  @override
  _FlatButtonState createState() => _FlatButtonState();
}

class _FlatButtonState extends State<FlatButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            title: Text(
              'Flat Button',
              style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
          )),
      body: Center(
        child: FlatButton.icon(
          onPressed: () {},
          onLongPress: () {},
          icon: Icon(Icons.volume_up),
          label: Text('Volume'),
          color: Colors.transparent,
          colorBrightness: Brightness.dark,
          autofocus: true,
          disabledColor: Colors.grey.shade700,
          disabledTextColor: Colors.white,
          focusColor: Colors.red,
          focusNode: FocusNode(debugLabel: 'Cuuuuu'),
          hoverColor: Colors.red,
          clipBehavior: Clip.antiAlias,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          padding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
          splashColor: Colors.blue[900],
          textColor: Colors.blue[900],
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 3, color: Colors.blue[900])),
          textTheme: ButtonTextTheme.primary,
          highlightColor: Colors.blue[50],
        ),
      ),
    );
  }
}
