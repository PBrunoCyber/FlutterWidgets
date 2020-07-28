import 'package:flutter/material.dart';
import 'package:Learn_1/pages/MaterialComponents/MaterialApp/firshPage.dart';
import 'package:Learn_1/pages/MaterialComponents/MaterialApp/secondPage.dart';

class NamedRoutesArguments extends StatefulWidget {
  @override
  NamedRoutesMaterial createState() => NamedRoutesMaterial();
}

class NamedRoutesMaterial extends State<NamedRoutesArguments> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/firstPage':
            final Dados dados = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => FirstPage(
                      titulo: dados.titulo,
                      descricao: dados.descricao,
                    ));
            break;
          default:
            print('Deu erro!');
        }
        return null;
      },
      home: Builder(
        builder: (context) => HomePage(),
      ),
      routes: {
        '/secondPage': (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Primeira tela'),
                onPressed: () {
                  Navigator.pushNamed(context, '/firstPage',
                      arguments: Dados('Primeira página',
                          'Essa é a descrição da primeira página!'));
                }),
            RaisedButton(
                child: Text('Segunda tela'),
                onPressed: () {
                  Navigator.pushNamed(context, '/secondPage',
                      arguments: Dados('Segunda página',
                          'Essa é a descrição da segunda página!'));
                }),
          ],
        ),
      ),
    );
  }
}

class Dados {
  String titulo;
  String descricao;

  Dados(this.titulo, this.descricao);
}
