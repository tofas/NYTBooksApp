import 'package:flutter/material.dart';
import 'package:marvelapp/bookdetail/BookDetailGridview.dart';
import 'package:marvelapp/entities/BookListType.dart';

class BookDetailPage extends StatelessWidget {
  static const routeName = 'detail';

  BookDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookDetailNavigationArguments args =
        ModalRoute
            .of(context)
            .settings
            .arguments;

    return Scaffold(
        appBar: AppBar(title: Text(args.listName)),
        body: new BookDetailGridView());
  }
}

class BookDetailNavigationArguments {
  final String listName;

  BookDetailNavigationArguments(this.listName);
}
