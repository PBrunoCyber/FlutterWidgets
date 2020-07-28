import 'package:flutter/material.dart';
import 'package:Learn_1/pages/MaterialComponents/MaterialApp/ReturnDatasPOP/secondPage.dart';
import 'package:Learn_1/pages/MaterialComponents/MaterialApp/ReturnDatasPOP/firstPage.dart';

class HomePagePop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      home: Builder(
        builder: (context) => HomePagePopResult(),
      ),
      routes: {
        '/secondPage': (context) => SecondPage(),
      },
    );
  }
}
