import 'package:flutter/material.dart';
import 'package:Learn_1/routes/MaterialApp/ListAndAnimate/secondPage.dart';

class FirstPageList extends StatelessWidget {
  final List<Lista> listas;
  FirstPageList({Key key, @required this.listas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página principal'),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemExtent: 60,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  this.listas[index].imagem,
                  fit: BoxFit.fill,
                  height: 200,
                  width: 400,
                ),
              ),
              title: Text(this.listas[index].titulo),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              lista: this.listas[index],
                            )));
              },
              subtitle: Text(this.listas[index].descricao),
              trailing: Icon(Icons.arrow_drop_down),
            );
          }),
    );
  }
}

class Lista {
  String imagem;
  String titulo;
  String descricao;

  Lista(this.imagem, this.titulo, this.descricao);
}
