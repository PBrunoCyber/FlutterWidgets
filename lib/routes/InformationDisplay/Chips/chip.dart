import 'package:flutter/material.dart';

class ChipPage extends StatefulWidget {
  @override
  _ChipState createState() => _ChipState();
}

class _ChipState extends State<ChipPage> {
  List<String> _label;
  @override
  void initState() {
    _label = ["Abelha", "Baleia", "Camelo", "Dromedário", "Esquilo", "Foca"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text("Chip"),
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
                return chip(_label, index, Colors.white);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget chip(List<String> label, int index, Color color) {
    return Chip(
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
      deleteButtonTooltipMessage: "Deletar ícone",
      deleteIconColor: Colors.grey,
      deleteIcon: Icon(Icons.close),
      elevation: 3,
      labelPadding: EdgeInsets.all(10),
      labelStyle: TextStyle(fontSize: 14),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      padding: EdgeInsets.all(0),
      shadowColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      onDeleted: () {
        setState(() {
          _label.removeAt(index);
          print(_label);
        });
      },
    );
  }
}
