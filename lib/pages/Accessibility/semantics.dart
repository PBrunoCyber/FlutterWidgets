import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SemanticsPage extends StatefulWidget {
  @override
  _SemanticsState createState() => _SemanticsState();
}

class _SemanticsState extends State<SemanticsPage> {
  static int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Semantics(
          label: "Barra de navegação superior",
          child: AppBar(title: Text("Semantics"), centerTitle: true),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              value:
                  _count == 0 ? 'Botão de contagem, valor: $_count' : '$_count',
              readOnly: true,
              onTap: () {
                setState(() {
                  _count++;
                });
              },
              child: ExcludeSemantics(
                child: Text(
                  '$_count',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
