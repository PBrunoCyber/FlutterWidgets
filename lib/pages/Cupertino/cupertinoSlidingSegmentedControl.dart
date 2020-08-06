import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSlidingSegmentedControlPage extends StatefulWidget {
  @override
  _CupertinoSlidingSegmentedControlState createState() =>
      _CupertinoSlidingSegmentedControlState();
}

class _CupertinoSlidingSegmentedControlState
    extends State<CupertinoSlidingSegmentedControlPage> {
//Variables
  int _selected = 0;
  static TextStyle _style = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: "Arial",
    fontSize: 12,
    color: Colors.black,
  );
  Map<int, Widget> _itens = <int, Widget>{
    0: Text("Home", style: _style),
    1: Text("Search Page", style: _style),
    2: Text("Configuration", style: _style)
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey.shade200,
        middle: Text("Segmented Control Ios 13"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: CupertinoSlidingSegmentedControl(
                groupValue: _selected,
                children: _itens,
                onValueChanged: (value) {
                  setState(() => _selected = value);
                },
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Center(
              child: Text(
                "Page",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
