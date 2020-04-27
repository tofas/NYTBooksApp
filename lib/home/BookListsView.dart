import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/Actions.dart';

import '../AppState.dart';
import 'BookListsApi.dart';

class BookListsView extends StatelessWidget {
  Widget getItem(BookList bookList) {
    return Row(
      children: <Widget>[Text(bookList.listName)],
    );
  }

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, List<BookList>>(
          onInit: (store) => store.dispatch(FetchBookListsAction()),
          converter: (store) => store.state.bookList,
          builder: (context, booklists) {
            return new ListView.builder(
                itemCount: booklists.length,
                itemBuilder: (context, position) {
                  return ListTile(title: getItem(booklists[position]));
                });
          });
}
