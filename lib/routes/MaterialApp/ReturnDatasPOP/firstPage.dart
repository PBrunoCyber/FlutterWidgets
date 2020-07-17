import 'package:flutter/material.dart';

class HomePagePopResult extends StatefulWidget {
  @override
  FirstPage createState() => FirstPage();
}

class FirstPage extends State<HomePagePopResult> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text('IR PARA TELA 2'),
              onPressed: () {
                _navigatorWithReturn(context);
              }),
          Text(this.result),
        ],
      )),
    );
  }

  _navigatorWithReturn(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/secondPage');
    setState(() {
      this.result = result;
    });
  }
}
