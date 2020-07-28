import 'package:flutter/material.dart';

class OutlineButtonPage extends StatefulWidget {
  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('Outline Button'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () {},
              onLongPress: () {},
              child: Text('Outline Button'),
              borderSide: BorderSide(color: Colors.blue[900], width: 2),
              textColor: Colors.blue[900],
              color: Colors.white,
              splashColor: Colors.indigo[400],
              padding: EdgeInsets.fromLTRB(90, 20, 90, 20),
              autofocus: false,
              focusColor: Colors.grey.shade900,
              clipBehavior: Clip.antiAlias,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              highlightColor: Colors.white,
              highlightElevation: 12,
              highlightedBorderColor: Colors.blue[900],
              disabledBorderColor: Colors.grey.shade700,
              disabledTextColor: Colors.grey.shade700,
              hoverColor: Colors.blue[50],
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              textTheme: ButtonTextTheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
