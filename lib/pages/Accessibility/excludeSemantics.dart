import 'package:flutter/material.dart';

class ExcludeSemanticsPage extends StatefulWidget {
  @override
  _ExcludeSemanticsState createState() => _ExcludeSemanticsState();
}

class _ExcludeSemanticsState extends State<ExcludeSemanticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Exclude Semantics"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: ExcludeSemantics(
          excluding: true,
          // Este widget (e seu subtree) é excluído da árvore semântica.
          child: Container(
            height: 300,
            width: 300,
            child: Image.network(
              'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                  value: loadingProgress != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
