import 'package:flutter/material.dart';

class NamedRoutesWithMaterialApp extends StatefulWidget {
  @override
  NamedRoutesMaterial createState() => NamedRoutesMaterial();
}

class NamedRoutesMaterial extends State<NamedRoutesWithMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TELA 1 BITCH')),
      body: Center(
          child: RaisedButton(
              child: Text('IR PRA TELA 2'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              })),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TELA 2 BITCH')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text('VOLTAR'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      )),
    );
  }
}
