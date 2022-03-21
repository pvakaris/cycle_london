import 'package:cycle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:cycle/pages/menu.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Favorites',
              style: kAppBarTextStyle),
          backgroundColor: Colors.lightBlue,
        ),

    );
  }
}