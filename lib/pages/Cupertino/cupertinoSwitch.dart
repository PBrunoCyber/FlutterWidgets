import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSwitchPage extends StatefulWidget {
  @override
  _CupertinoSwitchState createState() => _CupertinoSwitchState();
}

class _CupertinoSwitchState extends State<CupertinoSwitchPage> {
  List<bool> _isActive = [false, false, false, false];
  List<Color> _color = [Colors.red, Colors.green, Colors.blue, Colors.indigo];
  List<String> _nameColor = ["Red", "Green", "Blue", "Indigo"];

  Color _selectColor() {
    for (int i = 0; i < _isActive.length; i++) {
      if (_isActive[i]) return _color[i];
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Switch"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 150,
              margin: EdgeInsets.all(10),
              color: _selectColor(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_nameColor[index],
                          style: Theme.of(context).textTheme.headline6),
                      CupertinoSwitch(
                        value: _isActive[index],
                        activeColor: _color[index],
                        onChanged: (value) {
                          for (int i = 0; i < _isActive.length; i++) {
                            _isActive[i] = false;
                          }
                          setState(() => _isActive[index] = value);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
