import 'package:flutter/material.dart';

class CheckBoxListTilePage extends StatefulWidget {
  @override
  _CheckBoxListTileState createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<CheckBoxListTilePage> {
  List<bool> _isActive = [false, false, false, false];
  List<String> lista = ["Alberto", "Bruno", "Junior", "Marcos"];

  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('CheckBox'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: lista
                .map(
                  (value) => CheckboxListTile(
                    title: Text(value),
                    value: _isActive[lista.indexOf(value)],
                    onChanged: (bool val) {
                      setState(() {
                        _isActive[lista.indexOf(value)] = val;
                        (_isActive[lista.indexOf(value)] == true)
                            ? selected.add(lista[lista.indexOf(value)])
                            : selected.remove(lista[lista.indexOf(value)]);
                        selected.sort();
                        print(selected);
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.indigo[900],
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    secondary: Icon(
                      Icons.select_all,
                    ),
                    subtitle: Text('Select a option!'),
                    selected: false,
                    isThreeLine: false,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
