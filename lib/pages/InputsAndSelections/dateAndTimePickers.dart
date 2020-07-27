import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DateAndTimePickerPage extends StatefulWidget {
  @override
  _DateAndTimePickerState createState() => _DateAndTimePickerState();
}

class _DateAndTimePickerState extends State<DateAndTimePickerPage> {
  String _date;
  String _hora;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('Date and Time Picker'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text('SELECIONE UMA DATA'),
                padding: EdgeInsets.fromLTRB(90, 20, 90, 20),
                textColor: Colors.white,
                color: Colors.blue[400],
                splashColor: Colors.indigo[900],
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 12,
                onPressed: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.parse('2021-01-01 00:00:00'),
                    initialDatePickerMode: DatePickerMode.year,
                    cancelText: 'Cancelar',
                    confirmText: 'Okay',
                    errorFormatText: 'Formato de data incorreto!',
                    errorInvalidText: 'Data inválida!',
                    fieldHintText: 'DD/MM/YYYY',
                    fieldLabelText: 'Selecione uma data',
                    helpText: 'Selecione uma data :)',
                    initialEntryMode: DatePickerEntryMode.calendar,
                    textDirection: TextDirection.ltr,
                    useRootNavigator: true,
                  );

                  if (date != null) {
                    setState(() {
                      this._date = formatDate(date, [dd, '/', mm, '/', yyyy]);
                      this._hora = TimeOfDay.now().hour.toString() +
                          ':' +
                          TimeOfDay.now().minute.toString();
                    });
                  }
                },
              ),
            ),
            Text((this._date == null)
                ? 'Você ainda não selecionou :('
                : 'Data: ' + _date + '\nHora: ' + _hora),
          ],
        ),
      ),
    );
  }
}
