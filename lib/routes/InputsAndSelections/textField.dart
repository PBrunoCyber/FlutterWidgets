import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldPage> {
  TextEditingController _controller;
  String _value = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('TextField'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_value),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                autocorrect: true,
                autofocus: false,
                controller: _controller,
                cursorColor: Colors.indigo[900],
                cursorRadius: Radius.circular(100),
                cursorWidth: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                enabled: true,
                dragStartBehavior: DragStartBehavior.start,
                enableInteractiveSelection: true,
                enableSuggestions: true,
                keyboardAppearance: Brightness.dark,
                keyboardType: TextInputType.emailAddress,
                maxLength: 100,
                maxLengthEnforced: true,
                minLines: 1,
                maxLines: 1,
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    this._value = value;
                  });
                },
                onEditingComplete: () {
                  print('object');
                },
                onSubmitted: (value) {
                  print(this._value);
                },
                onTap: () {
                  print('Ok!');
                },
                readOnly: false,
                scrollController: ScrollController(
                  debugLabel: 'Hum',
                  initialScrollOffset: 10,
                  keepScrollOffset: false,
                ),
                scrollPadding: EdgeInsets.all(100),
                scrollPhysics: BouncingScrollPhysics(),
                selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
                selectionWidthStyle: BoxWidthStyle.max,
                showCursor: true,
                smartDashesType: SmartDashesType.enabled,
                smartQuotesType: SmartQuotesType.enabled,
                style: TextStyle(color: Colors.black54),
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.top,
                textCapitalization: TextCapitalization.sentences,
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.done,
                toolbarOptions:
                    ToolbarOptions(cut: false, paste: true, copy: true),
              ),
            )
          ],
        ),
      ),
    );
  }
}
