import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String titulo;
  final String descricao;

  const FirstPage({Key key, @required this.titulo, @required this.descricao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Center(
        child: Text(descricao),
      ),
    );
  }
}
