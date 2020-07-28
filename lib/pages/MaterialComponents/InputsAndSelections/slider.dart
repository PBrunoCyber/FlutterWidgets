import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<SliderPage> {
  static double _value = 0.0;
  int _result = _value.toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('Slider'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider.adaptive(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  _result = value.toInt();
                });
              },
              onChangeStart: (value) {
                print('Início');
              },
              onChangeEnd: (value) {
                print(value);
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: _result.toString(),
              activeColor: Colors.indigo[900],
              inactiveColor: Colors.grey.shade500,
            ),
            Text('Volume: ' + _result.toString()),
          ],
        ),
      ),
    );
  }
}
