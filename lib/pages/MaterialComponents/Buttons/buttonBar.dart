import 'package:flutter/material.dart';

class ButtonsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: AppBar(
              title: Text('Button Bar'),
              centerTitle: true,
            )),
        body: Center(
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonTextTheme: ButtonTextTheme.normal,
            buttonHeight: 50,
            buttonMinWidth: 195,
            overflowButtonSpacing: 10,
            mainAxisSize: MainAxisSize.max,
            buttonPadding: EdgeInsets.only(right: 5, left: 5),
            layoutBehavior: ButtonBarLayoutBehavior.padded,
            overflowDirection: VerticalDirection.down,
            buttonAlignedDropdown: true,
            children: <Widget>[
              RaisedButton(onPressed: () {}, child: Text('RAISED BUTTON')),
              RaisedButton(onPressed: () {}, child: Text('RAISED BUTTON')),
            ],
          ),
        ));
  }
}
