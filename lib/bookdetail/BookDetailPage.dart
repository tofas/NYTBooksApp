import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  static const routeName = 'detail';

  BookDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookDetailNavigationArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(args.listName)), body: Text(args.listNameEncoded));
  }
}

class BookDetailNavigationArguments {
  final String listName;
  final String listNameEncoded;

  BookDetailNavigationArguments(this.listName, this.listNameEncoded);
}
