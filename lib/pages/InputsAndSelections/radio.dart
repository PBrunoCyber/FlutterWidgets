import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<RadioPage> {
  List<String> options = ["Sim", "Não", "Talvez"];
  String _value;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('Radio'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Container(
          width: widthScreen / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: options.map((value) => _showRadio(value)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _showRadio(String value) {
    return ListTile(
      title: Text(value),
      leading: Radio(
          value: value,
          groupValue: _value,
          activeColor: Colors.indigo[900],
          autofocus: false,
          focusColor: Colors.blue,
          hoverColor: Colors.grey.shade500,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          visualDensity: VisualDensity.compact,
          onChanged: (value) {
            setState(() {
              this._value = value;
              print(_value);
            });
          }),
    );
  }
}
