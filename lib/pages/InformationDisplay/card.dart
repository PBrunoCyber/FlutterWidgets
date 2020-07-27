import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text("Card"),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(65),
      ),
      body: Center(
        child: Card(
          clipBehavior: Clip.none,
          color: Colors.indigo[400],
          borderOnForeground: true,
          elevation: 49,
          semanticContainer: true,
          shadowColor: Colors.indigo[900],
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.indigo[900],
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Testind a card title',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
