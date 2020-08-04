import 'package:flutter/material.dart';
import 'package:Learn_1/pages/Cupertino/cupertinoButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'AppBar tutorial';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue[900],
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      ),
      title: _title,
      home: CupertinoButtonPage(),
    );
  }
}
