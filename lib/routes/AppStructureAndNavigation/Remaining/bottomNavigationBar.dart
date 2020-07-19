import 'package:flutter/material.dart';

class BarNavigationBottomPage extends StatefulWidget {
  @override
  BarNavigationBottom createState() => BarNavigationBottom();
}

class BarNavigationBottom extends State<BarNavigationBottomPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  static const TextStyle styleBody =
      TextStyle(fontSize: 30, fontFamily: 'Roboto', color: Colors.black54);
  static const List<Widget> _widgetItems = <Widget>[
    Text(
      'Home',
      style: styleBody,
    ),
    Text(
      'Search',
      style: styleBody,
    ),
    Text(
      'Options',
      style: styleBody,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text('BottomNavigationBar',
              style: TextStyle(color: Colors.black)),
          elevation: 0.0,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
        ),
      ),
      drawer: Drawer(),
      body: Center(child: _widgetItems.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(
                icon: Icon(Icons.brightness_5), title: Text('Options')),
          ],
          currentIndex: _currentIndex,
          fixedColor: Colors.black,
          backgroundColor: Colors.red[10],
          unselectedItemColor: Colors.black26,
          onTap: _onItemTapped,
          iconSize: 20,
          elevation: 0.0,
          selectedIconTheme: IconThemeData(size: 25),
          unselectedIconTheme: IconThemeData(size: 20),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.shifting),
    );
  }
}
