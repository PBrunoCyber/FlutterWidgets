import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FutureBuilderRepoPage extends StatefulWidget {
  @override
  _FutureBuilderRepoState createState() => _FutureBuilderRepoState();
}

class _FutureBuilderRepoState extends State<FutureBuilderRepoPage> {
  Future<User> _user() async {
    var snapshot = await http.get(
        'https://api.github.com/users/mojombo?access_token=e9e6c5980e9ac14ac01ff0b924966b1480774e53 ');
    Map<String, dynamic> response = jsonDecode(snapshot.body);
    return User.fromJson(response);
  }

  Future<List<UserRepo>> _userRepo() async {
    var snapshot = await http.get(
        'https://api.github.com/users/mojombo/repos?access_token=e9e6c5980e9ac14ac01ff0b924966b1480774e53 ');
    List<dynamic> response = jsonDecode(snapshot.body);
    return response.map((e) => UserRepo.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Future Builder User Repo"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text("User",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: _user(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return _showUser(context, snapshot.data);
                  else
                    return CupertinoActivityIndicator();
                },
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text("Repositories",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: FutureBuilder(
                future: _userRepo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return _showUserRepo(context, snapshot.data);
                  else
                    return CupertinoActivityIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _showUser(BuildContext context, User user) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Image.network(
            user.avatarUrl,
            height: 80,
            width: 80,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CupertinoActivityIndicator();
            },
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: Theme.of(context).textTheme.headline6),
                Text(
                  user.location,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget _showUserRepo(BuildContext context, List<UserRepo> userRepo) {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: userRepo
            .map(
              (e) => ListTile(
                leading: Icon(Icons.book),
                title:
                    Text(e.name, style: Theme.of(context).textTheme.bodyText1),
                subtitle: Text(
                  e.description == null ? "No description" : e.description,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onTap: () {},
              ),
            )
            .toList(),
      ),
    ),
  );
}

class User {
  String avatarUrl;
  String name;
  String location;

  User(
      {@required this.avatarUrl, @required this.name, @required this.location});

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      avatarUrl: json['avatar_url'],
      location: json['location']);
}

class UserRepo {
  String name;
  String description;

  UserRepo({@required this.name, this.description});

  factory UserRepo.fromJson(Map<String, dynamic> jsonRepo) =>
      UserRepo(name: jsonRepo['name'], description: jsonRepo['description']);
}
