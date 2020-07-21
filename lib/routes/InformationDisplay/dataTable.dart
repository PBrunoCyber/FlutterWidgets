import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<DataTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text('DataTable'),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              dataRowHeight: 40,
              dividerThickness: 0,
              headingRowHeight: 50,
              columnSpacing: 10,
              horizontalMargin: 10,
              showCheckboxColumn: false,
              sortColumnIndex: 1,
              sortAscending: true,
              columns: <DataColumn>[
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Age')),
                DataColumn(label: Text('Role')),
                DataColumn(label: Text('e-mail')),
                DataColumn(label: Text('address')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sarah')),
                    DataCell(Text('19')),
                    DataCell(Text('Student')),
                    DataCell(Text('sarah_23@gmail.com')),
                    DataCell(Text("Kindwodn 12, London")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Janine')),
                    DataCell(Text('43')),
                    DataCell(Text('Professor')),
                    DataCell(Text('janineTI2@gmail.com')),
                    DataCell(Text("Sosqhie 13, Alabama")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('William')),
                    DataCell(Text('27')),
                    DataCell(Text('Associate Professor')),
                    DataCell(Text('williamK23@gmail.com')),
                    DataCell(Text("Sinque 38, Colorado")),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
