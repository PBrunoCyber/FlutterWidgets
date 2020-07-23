import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogState createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialogPage> {
  GlobalKey<ScaffoldState> _key;

  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(
          'Você tem certeza?',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Você tem certeza que aceita os termo de compromisso?',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                _key.currentState
                    .showSnackBar(SnackBar(content: Text("Você disse sim :)")));
                Navigator.of(context).pop();
              },
              child: Text(
                'Sim',
                style: TextStyle(color: Colors.black),
              )),
          FlatButton(
              onPressed: () {
                _key.currentState
                    .showSnackBar(SnackBar(content: Text("Você disse não :(")));
                Navigator.of(context).pop();
              },
              child: Text(
                'Não',
                style: TextStyle(color: Colors.black),
              )),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        actionsOverflowButtonSpacing: 10,
        actionsOverflowDirection: VerticalDirection.down,
        actionsPadding: EdgeInsets.all(10),
        backgroundColor: Colors.grey.shade100,
        titlePadding: EdgeInsets.all(20),
        semanticLabel: "Modal para aceitar termos de compromisso",
        scrollable: false,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
        clipBehavior: Clip.antiAlias,
        buttonPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.all(20),
        elevation: 10,
        contentTextStyle: TextStyle(color: Colors.black54),
        insetPadding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  void initState() {
    _key = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Alert Dialog"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aceitar termos de compromisso',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Divider(
              endIndent: 60,
              indent: 60,
            ),
            RaisedButton(
              onPressed: () {
                return _showDialog(context);
              },
              child: Text('Aceitar'),
            )
          ],
        ),
      ),
    );
  }
}
