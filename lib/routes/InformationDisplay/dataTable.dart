import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<DataTablePage> {
  List<Usuarios> usu = Usuarios.list();
  List<Usuarios> _selected = [];
  GlobalKey<ScaffoldState> _key;
  bool _asc;
  int _index;

  @override
  void initState() {
    usu = Usuarios.list();
    _key = GlobalKey<ScaffoldState>();
    _asc = true;
    _index = 0;
    super.initState();
  }

  void _ordenar(int index, bool asc) {
    switch (index) {
      case 0:
        (asc)
            ? usu.sort((a, b) => a.name.compareTo(b.name))
            : usu.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 1:
        (asc)
            ? usu.sort((a, b) => a.age.compareTo(b.age))
            : usu.sort((a, b) => b.age.compareTo(a.age));
        break;
    }
  }

  void _selectedUsu(bool select, Usuarios usuarios) async {
    setState(() {
      if (select) {
        _selected.add(usuarios);
      } else {
        _selected.remove(usuarios);
      }
    });
  }

  DataTable dataTables() {
    return DataTable(
      sortAscending: _asc,
      sortColumnIndex: _index,
      columns: [
        DataColumn(
            label: Text("Name"),
            numeric: false,
            onSort: (sortIndex, sortAsc) {
              setState(() {
                _asc = !_asc;
              });
              _ordenar(sortIndex, sortAsc);
            }),
        DataColumn(
          label: Text("Age"),
          numeric: true,
          onSort: (sortIndex, sortAsc) {
            setState(() {
              _asc = !_asc;
            });
            _ordenar(sortIndex, sortAsc);
          },
        ),
        DataColumn(label: Text("Email")),
        DataColumn(label: Text("Role")),
        DataColumn(label: Text("Address")),
      ],
      rows: usu.map((e) {
        return DataRow(
          selected: _selected.contains(e),
          onSelectChanged: (bool select) {
            return _selectedUsu(select, e);
          },
          cells: [
            DataCell(Text(e.name), showEditIcon: true, onTap: () {
              _key.currentState.showSnackBar(SnackBar(
                content: Text(e.name),
                duration: Duration(milliseconds: 500),
              ));
            }, placeholder: false),
            DataCell(Text(e.age.toString())),
            DataCell(Text(e.email)),
            DataCell(Text(e.role)),
            DataCell(Text(e.address)),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('DataTable'),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: dataTables(),
            ),
            Container(
                margin:
                    EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  _selected.isEmpty ? "" : "Nomes",
                  style: TextStyle(fontSize: 30),
                )),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                _selected.map((e) => e.name).join(", "),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Usuarios {
  String name;
  String role;
  int age;
  String email;
  String address;

  Usuarios({this.name, this.age, this.email, this.role, this.address});

  static List<Usuarios> list() {
    return <Usuarios>[
      Usuarios(
          name: "Bruno Fernandes",
          age: 20,
          email: "paulo.bf111@gmail.com",
          role: "Desempregado e solitário",
          address: "idwqo hihd oqwhdh q"),
      Usuarios(
          name: "Fernanda",
          age: 15,
          email: "fern11@gmail.com",
          role: "Estudante",
          address: "Riotrn, Portugal"),
      Usuarios(
          name: "João",
          age: 34,
          email: "john13@gmail.com",
          role: "Marceneiro",
          address: "OAPpodwq, EUA"),
      Usuarios(
          name: "Marcos Mendes",
          age: 13,
          email: "marcos_38@gmail.com",
          role: "Estudante",
          address: "idwqo hihd oqwhdh q"),
      Usuarios(
          name: "karol Feitosa",
          age: 40,
          email: "karl@gmail.com",
          role: "Desempregada",
          address: "idwqo hihd oqwhdh q"),
    ];
  }
}
