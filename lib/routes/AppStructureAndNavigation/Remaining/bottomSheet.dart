import 'package:flutter/material.dart';

class Modal {
  bottomSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: Wrap(
            children: <Widget>[
              _listTile(
                  context, 'Account Balance', Icons.account_balance, action1),
              _listTile(context, 'Acess Alarm', Icons.access_alarm, action2),
              _listTile(context, 'Accessibility', Icons.accessibility, action3)
            ],
          ));
        },
        backgroundColor: Colors.blue[50],
        clipBehavior: Clip.hardEdge,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))));
  }

  ListTile _listTile(
      BuildContext context, String title, IconData icon, Function action) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      onTap: action,
    );
  }

  void action1() {
    print('a');
  }

  void action2() {
    print('b');
  }

  void action3() {
    print('c');
  }
}
