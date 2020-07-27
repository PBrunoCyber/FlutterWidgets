import 'package:flutter/material.dart';

class GridViewBuilderPage extends StatefulWidget {
  @override
  _GridViewBuilderState createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilderPage> {
  List<String> _item;

  @override
  void initState() {
    _item = List<String>.generate(40, (index) => "Indice: $index").toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Grid View Builder"),
          centerTitle: true,
        ),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(5),
        itemCount: _item.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.indigo[100 * (index % 9) + 100],
            child: Center(
              child: Container(
                child: Text(
                  _item[index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350,
          childAspectRatio: 0.9,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
