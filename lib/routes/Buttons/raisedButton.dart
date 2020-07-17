import 'package:flutter/material.dart';

class RaisedButtonPage extends StatefulWidget {
  @override
  _RaisedButtonState createState() => _RaisedButtonState();
}

class _RaisedButtonState extends State<RaisedButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('Raised Button'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              onLongPress: () {},
              colorBrightness: Brightness.dark,
              child: Text('RAISED BUTTON'),
              clipBehavior: Clip.hardEdge,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 24,
              autofocus: true,
              splashColor: Colors.indigo[900],
              color: Colors.blue[900],
              visualDensity: VisualDensity.adaptivePlatformDensity,
              highlightColor: Colors.indigo[100],
              highlightElevation: 12,
              onHighlightChanged: (value) => print('Pressionado!'),
              animationDuration: Duration(seconds: 1),
              textColor: Colors.white,
              hoverColor: Colors.blue[400],
              hoverElevation: 12,
              disabledColor: Colors.grey.shade600,
              disabledElevation: 6,
              disabledTextColor: Colors.white,
              focusColor: Colors.indigo[900],
              focusElevation: 12,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              padding: EdgeInsets.fromLTRB(90, 20, 90, 20),
              focusNode: FocusNode(
                canRequestFocus: true,
                debugLabel: 'Aqui!',
                skipTraversal: false,
              ),
              textTheme: ButtonTextTheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
