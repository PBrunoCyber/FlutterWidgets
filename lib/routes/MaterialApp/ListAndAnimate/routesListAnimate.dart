import 'package:flutter/material.dart';
import 'package:Learn_1/routes/MaterialApp/ListAndAnimate/firstPage.dart';

class HomePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      home: Builder(
        builder: (context) => FirstPageList(
          listas: List.generate(
              20,
              (index) => Lista(
                  'http://www.myguiadeviajes.com/wp-content/uploads/2018/08/IMG_4430.jpg',
                  'Lista $index',
                  'Essa é descrição de número $index')),
        ),
      ),
    );
  }
}
