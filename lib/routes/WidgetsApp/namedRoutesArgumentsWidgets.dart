import 'package:flutter/material.dart';

class NamedRoutesArguments extends StatefulWidget {
  @override
  NamedRoutes createState() => NamedRoutes();
}

class NamedRoutes extends State<NamedRoutesArguments> {
  String mensagens = '';

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.red[50],
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => screen1(context));
          case '/page2':
            return MaterialPageRoute(
                builder: (context) => screen2(context, settings.arguments));
        }
        return null;
      },
    );
  }

  Widget screen1(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                onPressed: () async {
                  final message = await Navigator.of(context)
                          .pushNamed('/page2', arguments: "Ola") ??
                      '';
                  setState(() {
                    this.mensagens = message;
                  });
                }),
            Text(mensagens),
          ],
        ),
      ),
      backgroundColor: Colors.red[50],
    ));
  }

  Widget screen2(BuildContext context, String mensagem) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),
        backgroundColor: Colors.blue[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop("Ola mundo!");
          },
        ),
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
                  Navigator.of(context).pop("Ola mundo!");
                }),
            Divider(),
            Text(mensagem)
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],
    ));
  }
}
