import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CupertinoTextFieldPage extends StatefulWidget {
  @override
  _CupertinoTextFieldState createState() => _CupertinoTextFieldState();
}

class _CupertinoTextFieldState extends State<CupertinoTextFieldPage> {
  TextEditingController _textEditingController;
  String _name = "";

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidht = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey.shade200,
        middle: Text("Cupertino Text Field"),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: _screenWidht - 50,
              child: CupertinoTextField(
                placeholder: "Type your name",
                autocorrect: true,
                controller: _textEditingController,
                dragStartBehavior: DragStartBehavior.start,
                keyboardType: TextInputType.text,
                maxLength: 50,
                maxLengthEnforced: true,
                scrollPhysics: BouncingScrollPhysics(),
                onChanged: (value) => setState(() => _name = value),
                padding:
                    EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                suffix: Padding(
                  child: Icon(Icons.near_me),
                  padding: EdgeInsets.only(right: 10),
                ),
                keyboardAppearance: Brightness.light,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(_name, style: Theme.of(context).textTheme.bodyText2),
            ),
          ],
        ),
      ),
    );
  }
}
