import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => voltar(context),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tela 2'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                voltar(context);
              },
            ),
          ),
        ));
  }
}

voltar(BuildContext context) {
  Navigator.pop(context, "Ola da tela 2");
}
