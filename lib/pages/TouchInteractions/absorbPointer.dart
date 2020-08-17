import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AbsorbPointerPage extends StatefulWidget {
  @override
  _AbsorbState createState() => _AbsorbState();
}

class _AbsorbState extends State<AbsorbPointerPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Absorb Pointer"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: AbsorbPointer(
          absorbing: true,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 40,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(index);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red[200],
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ),
    );
  }
}
