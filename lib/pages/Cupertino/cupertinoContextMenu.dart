import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuPage extends StatefulWidget {
  @override
  _CupertinoContextMenuState createState() => _CupertinoContextMenuState();
}

class _CupertinoContextMenuState extends State<CupertinoContextMenuPage> {
  static String _request = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Cupertino Context Menu"), centerTitle: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              decoration: ShapeDecoration(
                  color: Colors.green[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: Padding(
                padding: EdgeInsets.all(40),
                child: CupertinoContextMenu(
                  actions: <Widget>[
                    CupertinoContextMenuAction(
                      child: Center(child: Text("Sim")),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() => _request = "Sim");
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Center(child: Text("Não")),
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() => _request = "Não");
                      },
                    ),
                  ],
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CupertinoActivityIndicator();
                    },
                  ),
                  previewBuilder: (context, animation, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 10,
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
                            height: 300,
                            width: 300,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CupertinoActivityIndicator();
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Você gostou dessa foto?",
                            style: (Theme.of(context).textTheme.headline5),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 20,
            ),
            Text(_request, style: Theme.of(context).textTheme.bodyText1)
          ],
        ),
      ),
    );
  }
}
