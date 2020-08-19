import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggableState createState() => _DraggableState();
}

class _DraggableState extends State<DraggablePage> {
  bool _isAccept = false;
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Draggable"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: _screenWidth / 3 + 10,
            bottom: _screenHeight / 1.5,
            child: DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Center(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      _isAccept ? Colors.transparent : Colors.black,
                      BlendMode.srcATop,
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return CupertinoActivityIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              onAccept: (int data) {
                if (data == 0) {
                  setState(() => _isAccept = true);
                }
              },
            ),
          ),
          DragWidget(
            offset: Offset(_screenWidth / 3 + 10, _screenHeight / 4),
            isAccept: _isAccept,
          ),
        ],
      ),
    );
  }
}

class DragWidget extends StatefulWidget {
  final Offset offset;
  final bool isAccept;
  DragWidget({Key key, @required this.offset, @required this.isAccept})
      : super(key: key);

  @override
  _DragWidgetState createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  Offset offset = Offset(0.0, 0.0);
  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      bottom: offset.dy,
      child: Draggable(
        child: !widget.isAccept
            ? Container(
                height: 100,
                width: 100,
                child: Center(
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CupertinoActivityIndicator();
                    },
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 90,
                    color: Colors.green,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "It's a frog!",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
        feedback: Opacity(
          opacity: 0.5,
          child: Image.network(
            'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
            height: 100,
            width: 100,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CupertinoActivityIndicator();
            },
          ),
        ),
        data: 0,
      ),
    );
  }
}
