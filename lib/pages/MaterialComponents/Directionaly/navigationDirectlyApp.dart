import 'package:flutter/material.dart';

class NavigationDirectlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Navigator(
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(builder: (BuildContext context) {
              return _screen1(context);
            });
          },
        ));
  }

  Widget _screen1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
        backgroundColor: Colors.red[100],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen 1',
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
                child: Text('Ir para a tela 2'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => _screen2(context),
                  ));
                }),
          ],
        ),
      ),
      backgroundColor: Colors.red[50],
    );
  }

  Widget _screen2(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),
        backgroundColor: Colors.blue[100],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen 2',
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
                child: Text('Voltar para a tela 1'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],
    );
  }
}
