import 'package:flutter/material.dart';

class FilterChipPage extends StatefulWidget {
  @override
  _FilterChipState createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChipPage> {
  List<Animal> _label;
  List<String> _selected = [];
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    _label = <Animal>[
      const Animal("Abelha"),
      const Animal("Baleia"),
      const Animal("Camelo"),
      const Animal("Dromedário"),
      const Animal("Esquilo"),
      const Animal("Foca")
    ];
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
          title: Text("Fliter Chip"),
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
              children: animalsWidget.toList(),
            )
          ],
        ),
      ),
    );
  }

  //Percorre a lista de animais
  Iterable<Widget> get animalsWidget sync* {
    for (Animal animal in _label) {
      yield Padding(
          padding: EdgeInsets.all(10), child: inputChip(animal, _label));
    }
  }

  //InputChip
  Widget inputChip(Animal animal, List<Animal> _label) {
    return FilterChip(
      label: Text(
        animal.name,
        style: TextStyle(color: Colors.black54),
      ),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade400,
        child: Text(
          animal.name[0].toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      checkmarkColor: Colors.greenAccent,
      showCheckmark: true,
      selectedColor: Colors.greenAccent,
      selected: _selected.contains(animal.name),
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
      tooltip: "Oops!",
      selectedShadowColor: Colors.black,
      disabledColor: Colors.grey.shade100,
      onSelected: (bool selected) {
        setState(
          () {
            if (selected) {
              _selected.add(animal.name);
            } else {
              _selected.removeWhere((String name) {
                return name == animal.name;
              });
            }
            print(_selected);
          },
        );
      },
    );
  }
}

class Animal {
  const Animal(this.name);
  final String name;

  @override
  String toString() {
    return name;
  }
}
