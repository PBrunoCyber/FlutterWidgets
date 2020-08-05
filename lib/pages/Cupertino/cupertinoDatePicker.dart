import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class CupertinoDatePickerPage extends StatefulWidget {
  @override
  _CupertinoDatePickerState createState() => _CupertinoDatePickerState();
}

class _CupertinoDatePickerState extends State<CupertinoDatePickerPage> {
  String _date = "";

  void _showCupertinoDatePicker(BuildContext context) async {
    var request = await showCupertinoModalPopup(
      context: context,
      builder: (context) => DataPickerCupertinoResult(),
    );
    setState(() => _date = formatDate(request, [dd, '-', mm, '-', yyyy]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Cupertino Date Picker"), centerTitle: true),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton.filled(
            child: Text("Show Cupertino Date"),
            onPressed: () => _showCupertinoDatePicker(context),
          ),
          Divider(color: Colors.transparent, height: 20),
          Text(_date, style: Theme.of(context).textTheme.headline6)
        ],
      )),
    );
  }
}

class DataPickerCupertinoResult extends StatefulWidget {
  @override
  _DataPickerCupertinoResultState createState() =>
      _DataPickerCupertinoResultState();
}

class _DataPickerCupertinoResultState extends State<DataPickerCupertinoResult> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              minimumYear: (1990),
              maximumYear: (2021),
              use24hFormat: true,
              onDateTimeChanged: (DateTime date) {
                setState(
                  () => _date = date,
                );
              },
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: CupertinoButton(
              child: Text("Enviar"),
              color: Colors.black54,
              onPressed: () => Navigator.of(context).pop(_date),
            ),
          ),
        ],
      ),
    );
  }
}
