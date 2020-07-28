import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerPage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 10;
    double screenHeight = MediaQuery.of(context).size.height - 20;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 100,
            child: AppBar(
              title: Text("Animated Container"),
              centerTitle: true,
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  duration:
                      selected ? Duration(seconds: 2) : Duration(seconds: 1),
                  curve: selected ? Curves.elasticOut : Curves.ease,
                  width: selected ? screenWidth : 100,
                  height: selected ? screenHeight : 50,
                  margin: selected
                      ? EdgeInsets.only(top: 35, bottom: 5)
                      : EdgeInsets.all(0),
                  child: !selected
                      ? Center(
                          child: Text("Clique aqui!",
                              style: TextStyle(color: Colors.white)))
                      : Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_back, color: Colors.white)),
                  decoration: ShapeDecoration(
                    color: selected ? Colors.indigo[900] : Colors.grey,
                    shape: selected
                        ? RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))
                        : RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
