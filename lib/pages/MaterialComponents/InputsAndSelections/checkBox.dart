import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxPage> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: lista
                .map(
                  (value) => Row(
                    children: [
                      Expanded(
                        child: Checkbox(
                          value: _isActive[lista.indexOf(value)],
                          onChanged: (bool val) {
                            setState(() {
                              _isActive[lista.indexOf(value)] = val;
                              (_isActive[lista.indexOf(value)] == true)
                                  ? selected.add(lista[lista.indexOf(value)])
                                  : selected
                                      .remove(lista[lista.indexOf(value)]);
                              selected.sort();
                              print(selected);
                            });
                          },
                          tristate: false,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          hoverColor: Colors.grey.shade500,
                          autofocus: true,
                          focusColor: Colors.grey,
                          checkColor: Colors.white,
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          activeColor: Colors.indigo[900],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
