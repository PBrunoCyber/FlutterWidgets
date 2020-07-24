import 'package:flutter/material.dart';
import 'package:Learn_1/routes/AppStructureAndNavigation/Remaining/bottomSheet.dart';

class ScaffoldHomePage extends StatefulWidget {
  @override
  _ScaffoldHome createState() => _ScaffoldHome();
}

class _ScaffoldHome extends State<ScaffoldHomePage> {
  int _index = 0;
  static const TextStyle _text =
      TextStyle(fontFamily: 'Roboto', fontSize: 30, color: Colors.black);
  final List<Widget> _itens = [
    Text(
      'Home Page',
      style: _text,
    ),
    Text(
      'Search Page',
      style: _text,
    ),
    Text(
      'Add Page',
      style: _text,
    ),
  ];
  void _currentIndex(int index) {
    setState(() {
      this._index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(60)),
            title: Text(
              'Scaffold Widget',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: false,
          )),
      body: Center(child: _itens.elementAt(_index)),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 22,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_5), title: Text('Options')),
        ],
        currentIndex: _index,
        onTap: _currentIndex,
        selectedItemColor: Colors.black,
      ),
      floatingActionButton: FloatActionBottom(),
      drawer: Drawer(),
      drawerEdgeDragWidth: 100,
      drawerEnableOpenDragGesture: false,
      drawerScrimColor: Colors.black12,
      primary: true,
      extendBody: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.grey[200],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomInset: true,
    );
  }
}

class FloatActionBottom extends StatefulWidget {
  @override
  FloatingAction createState() => FloatingAction();
}

class FloatingAction extends State<FloatActionBottom> {
  Modal modal = Modal();
  Icon icon = Icon(Icons.slideshow);
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (isActive) {
          Navigator.pop(context);
          icon = Icon(Icons.slideshow);
          setState(() {
            isActive = false;
          });
        } else {
          icon = Icon(Icons.close);
          setState(() {
            isActive = true;
          });
          var bottom = modal.bottomSheet(context);
          bottom.closed.then((values) {
            setState(() {
              isActive = false;
              icon = Icon(Icons.slideshow);
            });
          });
        }
      },
      backgroundColor: Colors.blue[100],
      child: icon,
    );
  }
}
