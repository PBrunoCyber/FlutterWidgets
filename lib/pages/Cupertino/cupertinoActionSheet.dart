import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActionSheetPage extends StatefulWidget {
  @override
  _CupertinoActionSheetState createState() => _CupertinoActionSheetState();
}

class _CupertinoActionSheetState extends State<CupertinoActionSheetPage> {
  String _selected = "";

  void _showCupertinoSheet(BuildContext context) async {
    var request = await showCupertinoModalPopup(
      context: context,
      semanticsDismissible: true,
      builder: (context) => MyActionSheet(),
    );
    setState(() => _selected = request == null ? "" : request);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Cupertino Action Sheet"), centerTitle: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () => _showCupertinoSheet(context),
              child: Text("Show Action Sheet"),
              borderSide: BorderSide(color: Colors.black),
            ),
            Divider(color: Colors.transparent, height: 20),
            Text(_selected),
          ],
        ),
      ),
    );
  }
}

class MyActionSheet extends StatefulWidget {
  @override
  _MyActionSheetState createState() => _MyActionSheetState();
}

class _MyActionSheetState extends State<MyActionSheet> {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop("Primeira Opção"),
          child: Text("Primeira Opção"),
        ),
        CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop("Segunda Opção"),
          child: Text("Segunda Opção"),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.of(context).pop("Cancelado"),
        child: Text("Cancel"),
        isDestructiveAction: true,
        isDefaultAction: false,
      ),
      title: Text("Cupertino Action Sheet",
          style: Theme.of(context).textTheme.headline6),
      message: Text("Choose a option!",
          style: Theme.of(context).textTheme.bodyText2),
    );
  }
}
