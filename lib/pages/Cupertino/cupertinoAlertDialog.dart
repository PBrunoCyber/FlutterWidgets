import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlertDialogPage extends StatefulWidget {
  @override
  _CupertinoAlertDialogState createState() => _CupertinoAlertDialogState();
}

class _CupertinoAlertDialogState extends State<CupertinoAlertDialogPage> {
  static String _choose = "";

  void _showAlertDialog(BuildContext context) async {
    var request = await showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Termos de comprimisso",
              style: Theme.of(context).textTheme.headline6),
          content: Text(
              "Tem certeza que quer aceitar os termos de compromisso?",
              style: Theme.of(context).textTheme.bodyText2),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("Aceitar"),
              onPressed: () => Navigator.of(context).pop("Aceito"),
            ),
            CupertinoDialogAction(
              child: Text("Cancelar"),
              isDestructiveAction: true,
              onPressed: () => Navigator.of(context).pop("Cancelado"),
            ),
          ],
          insetAnimationCurve: Curves.elasticIn,
          insetAnimationDuration: Duration(seconds: 1),
        );
      },
    );
    setState(() => _choose = request == null ? "" : request);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Cupertino Alert Dialog"), centerTitle: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () => _showAlertDialog(context),
              borderSide: BorderSide(color: Colors.black),
              child: Text("Show Cupertino Alert Dialog"),
            ),
            Divider(color: Colors.transparent, height: 30),
            Text(_choose, style: Theme.of(context).textTheme.headline6)
          ],
        ),
      ),
    );
  }
}
