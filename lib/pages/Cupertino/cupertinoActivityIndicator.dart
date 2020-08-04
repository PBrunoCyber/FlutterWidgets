import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActivityIndicatorPage extends StatefulWidget {
  @override
  _CupertinoActivityIndicatorState createState() =>
      _CupertinoActivityIndicatorState();
}

class _CupertinoActivityIndicatorState
    extends State<CupertinoActivityIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
            title: Text("Cupertino Activity Indicator"), centerTitle: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Indicator: ",
                    style: Theme.of(context).textTheme.headline6),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: CupertinoActivityIndicator(
                    animating: true,
                    radius: 10,
                  ),
                ),
              ],
            ),
            Divider(
              height: 40,
              endIndent: 50,
              indent: 50,
            ),
            Text("Indicator in a image",
                style: Theme.of(context).textTheme.headline6),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CupertinoActivityIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
