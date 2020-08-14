import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FractionalTranslationPage extends StatefulWidget {
  @override
  _FractionalTranslationState createState() => _FractionalTranslationState();
}

class _FractionalTranslationState extends State<FractionalTranslationPage> {
  Offset _translation = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Fractional Translation"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: FractionalTranslation(
        translation: _translation,
        transformHitTests: true,
        child: Container(
          height: 200,
          width: 200,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}
