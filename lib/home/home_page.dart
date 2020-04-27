import 'package:flutter/material.dart';
import 'package:marvelapp/home/BookListsView.dart';
import 'package:marvelapp/resources/strings.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  final String title = HomePage.home_page_title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)), body: new BookListsView());
  }
}
