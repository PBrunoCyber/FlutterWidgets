import 'package:flutter/material.dart';
import 'package:Learn_1/pages/MaterialApp/namedRoutesArguments.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Dados dados = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(dados.titulo)),
      body: Center(
        child: Text(dados.descricao),
      ),
    );
  }
}
