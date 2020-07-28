import 'package:flutter/material.dart';
import 'package:Learn_1/pages/MaterialComponents/MaterialApp/ListAndAnimate/firstPage.dart';

class SecondPage extends StatelessWidget {
  final Lista lista;

  SecondPage({Key key, @required this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(this.lista.titulo),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        backgroundColor: Colors.red[100],
      ),
      body: GestureDetector(
        child: Center(
            child: Column(
          children: <Widget>[
            Image.network(
              this.lista.imagem,
              fit: BoxFit.fill,
              height: 200,
              width: widthSize,
            ),
            Divider(),
            Text(
              this.lista.descricao,
              style: TextStyle(fontSize: 20),
            )
          ],
        )),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
