import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_color/random_color.dart';

class LimitedBoxPage extends StatefulWidget {
  @override
  _LimitedBoxState createState() => _LimitedBoxState();
}

class _LimitedBoxState extends State<LimitedBoxPage> {
  RandomColor _random = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Limited Box"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          for (var i = 0; i < 20; i++)
            LimitedBox(
              maxHeight: 150,
              child: Container(
                color: _random.randomColor(
                  colorSaturation: ColorSaturation.mediumSaturation,
                  colorBrightness: ColorBrightness.dark,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
