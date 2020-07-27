import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  static const String _title = "DropDown";
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text(_title),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: DropdownButton(
          value: dropDownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 25,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          underline: Container(
            height: 3,
            color: Colors.blue[900],
          ),
          dropdownColor: Colors.blue[50],
          autofocus: true,
          disabledHint: Text('Ta coisado o negocio!'),
          focusColor: Colors.black,
          hint: Text('Selecione ', style: TextStyle(fontSize: 20)),
          iconDisabledColor: Colors.grey,
          itemHeight: 80,
          isDense: false,
          isExpanded: false,
          iconEnabledColor: Colors.black,
          items: <String>['Primeiro', 'Segundo', 'Terceiro', 'Quarto', 'Quinto']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 20),
                ));
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              this.dropDownValue = newValue;
            });
          },
          onTap: () {
            print('Ok!');
          },
        ),
      ),
    );
  }
}
