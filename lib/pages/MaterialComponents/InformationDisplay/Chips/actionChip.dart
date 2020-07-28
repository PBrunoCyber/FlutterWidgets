import 'package:flutter/material.dart';

class ActionChipPage extends StatefulWidget {
  @override
  _ActionChipState createState() => _ActionChipState();
}

class _ActionChipState extends State<ActionChipPage> {
  List<String> _label;
  GlobalKey<ScaffoldState> _key;
  @override
  void initState() {
    _label = ["Abelha", "Baleia", "Camelo", "Dromedário", "Esquilo", "Foca"];
    _key = GlobalKey<ScaffoldState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text("Action Chip"),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Wrap(
              runSpacing: 5.0,
              spacing: 10.0,
              children: List<Widget>.generate(_label.length, (index) {
                return actionChip(_label, index, Colors.white);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionChip(List<String> label, int index, Color color) {
    return ActionChip(
      label: Text(
        _label[index],
        style: TextStyle(color: Colors.black54),
      ),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade400,
        child: Text(
          _label[index][0].toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: color,
      autofocus: false,
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      labelPadding: EdgeInsets.all(10),
      labelStyle: TextStyle(fontSize: 14),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      padding: EdgeInsets.all(5.0),
      shadowColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pressElevation: 12,
      onPressed: () {
        _key.currentState.showSnackBar(
          SnackBar(
            content: Text(_label[index]),
            duration: Duration(milliseconds: 500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
        );
      },
    );
  }
}
