import 'package:flutter/material.dart';

class PopUpMenuButtonPage extends StatefulWidget {
  @override
  _PopUpMenuButtonState createState() => _PopUpMenuButtonState();
}

enum Itens { primeiro, segundo, terceiro, quarto }

class _PopUpMenuButtonState extends State<PopUpMenuButtonPage> {
  Itens _selecionado;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            title: Text('PopUpMenuButton'),
            centerTitle: true,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PopupMenuButton<Itens>(
              onSelected: (Itens results) {
                setState(() {
                  this._selecionado = results;
                  print(this._selecionado);
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Itens>>[
                PopupMenuItem(
                  value: Itens.primeiro,
                  child: Row(
                    children: <Widget>[Icon(Icons.add), Text('Adicionar')],
                  ),
                ),
                PopupMenuItem(
                  value: Itens.segundo,
                  child: Row(
                    children: <Widget>[Icon(Icons.share), Text('Compartilhar')],
                  ),
                ),
                PopupMenuItem(
                  value: Itens.terceiro,
                  child: Row(
                    children: <Widget>[Icon(Icons.remove), Text('Limpar')],
                  ),
                ),
                PopupMenuItem(
                  height: 80,
                  value: Itens.quarto,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        'Remover',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ],
              color: Colors.white,
              elevation: 12,
              onCanceled: () => print('1'),
              offset: Offset(0, 0),
              captureInheritedThemes: true,
              tooltip: 'This is a more vert menu',
              enabled: true,
              padding: EdgeInsets.all(10),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              icon: Icon(Icons.more_vert),
            ),
            Text((this._selecionado == null) ? '' : '$_selecionado'),
          ],
        ),
      ),
    );
  }
}
