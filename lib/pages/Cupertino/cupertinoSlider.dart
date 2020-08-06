import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSliderPage extends StatefulWidget {
  @override
  _CupertinoSliderState createState() => _CupertinoSliderState();
}

class _CupertinoSliderState extends State<CupertinoSliderPage> {
  static double _value = 0.0;
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Slider"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Volume: " + this._result.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: CupertinoSlider(
                  value: _value,
                  divisions: 100,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                      _result = value.toInt();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
