import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexedStackPage extends StatefulWidget {
  @override
  _IndexedStackState createState() => _IndexedStackState();
}

class _IndexedStackState extends State<IndexedStackPage> {
  List<bool> _isActive = [true, false, false];
  int _index = 0;
  List<Color> _color = [
    Colors.green[100],
    Colors.red[100],
    Colors.blue[100],
    Colors.grey.shade300
  ];
  List<String> _images = [
    "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png",
    "https://www.pngpix.com/wp-content/uploads/2016/11/PNGPIX-COM-Target-PNG-Transparent-Image-2.png",
    "https://rccck.org/templates/default/img/time-icon.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("IndexedStack"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: IndexedStack(
                    index: _index,
                    children: [
                      for (var i = 0; i < 3; i++)
                        Image.network(
                          _images[i],
                          height: MediaQuery.of(context).size.height,
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CircleAvatar(
                      radius: 67,
                      backgroundColor:
                          _isActive[index] ? _color[index] : _color[3],
                      child: GestureDetector(
                        onTap: () {
                          for (var j = 0; j < 3; j++) {
                            setState(() => _isActive[j] = false);
                          }
                          setState(
                            () {
                              _isActive[index] = true;
                              _index = index;
                            },
                          );
                        },
                        child: Image.network(
                          _images[index],
                          height: 70,
                          width: 70,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
