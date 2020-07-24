import 'package:flutter/material.dart';

class SimpleDialogPage extends StatefulWidget {
  @override
  _SimpleDialogState createState() => _SimpleDialogState();
}

class _SimpleDialogState extends State<SimpleDialogPage> {
  GlobalKey<ScaffoldState> _key;

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
          title: Text("Simple Dialog"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolher modos de visualização',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Divider(
              endIndent: 60,
              indent: 60,
            ),
            RaisedButton(
              onPressed: () {
                return _showSimpleDialog(context);
              },
              child: Text('Escolher'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showSimpleDialog(BuildContext context) async {
    switch (await showDialog<int>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          insetAnimationDuration: Duration(seconds: 2),
          insetAnimationCurve: Curves.easeInCirc,
          elevation: 40,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          insetPadding: EdgeInsets.all(40),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Wrap(
              children: <Widget>[
                Text(
                  "Escolha uma das opções",
                  style: TextStyle(fontSize: 25),
                ),
                Divider(
                  endIndent: 60,
                  indent: 60,
                ),
                ListTile(
                  title: Text("Primeira opção"),
                  onTap: () => Navigator.of(context).pop(1),
                ),
                ListTile(
                  title: Text("Segunda opção"),
                  onTap: () => Navigator.of(context).pop(2),
                ),
              ],
            ),
          ),
        );
      },
    )) {
      case 1:
        _key.currentState.showSnackBar(SnackBar(
          content: Text("Primeira opção!"),
        ));
        break;
      case 2:
        _key.currentState.showSnackBar(SnackBar(
          content: Text("Segunda opção!"),
        ));
        break;

      default:
    }
  }
}
