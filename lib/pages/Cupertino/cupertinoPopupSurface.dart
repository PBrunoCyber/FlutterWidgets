import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPopupSurfacePage extends StatefulWidget {
  @override
  _CupertinoPopupSurfaceState createState() => _CupertinoPopupSurfaceState();
}

class _CupertinoPopupSurfaceState extends State<CupertinoPopupSurfacePage> {
  void _showCupertinoPopupSurface(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return PopupSurface();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(title: Text("Cupertino Dialog"), centerTitle: true),
      ),
      body: Center(
        child: CupertinoButton.filled(
          child: Text("Show Cupertino Dialog"),
          onPressed: () => _showCupertinoPopupSurface(context),
        ),
      ),
    );
  }
}

class PopupSurface extends StatefulWidget {
  @override
  _PopupSurfaceState createState() => _PopupSurfaceState();
}

class _PopupSurfaceState extends State<PopupSurface> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CupertinoPopupSurface(
          isSurfacePainted: true,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Wrap(
              runSpacing: 0,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Cupertino Popup Surface",
                      style: Theme.of(context).textTheme.headline6),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "This a cupertino popup purface",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "Consectetur anim minim reprehenderit eu exercitation. Do Lorem veniam eu proident exercitation nisi dolor. Aliqua ea exercitation sit mollit tempor sint magna voluptate consectetur ad do quis minim veniam.",
                  style: TextStyle(
                    fontSize: 12,
                    inherit: false,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
