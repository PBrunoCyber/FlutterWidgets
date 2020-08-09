import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureBuilder1Page extends StatefulWidget {
  @override
  _FutureBuilder1State createState() => _FutureBuilder1State();
}

class _FutureBuilder1State extends State<FutureBuilder1Page> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text("Future Builder"),
          backgroundColor: Colors.grey.shade200),
      child: Center(
        child: FutureBuilder(
          future: _user(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _showUser(snapshot.data);
            } else
              return CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }

  Future<User> _user() async {
    var snapshot = await http.get('https://api.github.com/users/PBrunoCyber');
    Map<String, dynamic> response = jsonDecode(snapshot.body);
    return User.fromJson(response);
  }

  Widget _showUser(User datas) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          datas.avatarUrl,
          height: 170,
          width: 170,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return CupertinoActivityIndicator();
          },
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            datas.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}

class User {
  String avatarUrl;
  String name;

  User({@required this.avatarUrl, @required this.name});

  factory User.fromJson(Map<String, dynamic> usersjson) =>
      User(avatarUrl: usersjson['avatar_url'], name: usersjson['name']);
}
