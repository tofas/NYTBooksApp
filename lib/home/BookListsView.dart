import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/bookdetail/BookDetailPage.dart';
import 'package:marvelapp/entities/BookLists.dart';
import 'package:marvelapp/home/BookListsViewModel.dart';

import '../reducers/AppState.dart';
import 'BookListsApi.dart';

class BookListsView extends StatelessWidget {
  Widget getItem(BookList bookList) {
    return Row(
      children: <Widget>[Text(bookList.listName)],
    );
  }

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BookListsViewModel>(
          onInit: (store) => store.dispatch(FetchBookListsAction()),
          converter: (store) =>
              BookListsViewModel(store.state.bookList, store.state.isFetching),
          builder: (context, viewModel) {
            if (viewModel.isFetching) {
              return Center(child: CircularProgressIndicator());
            } else {
              return new ListView.builder(
                  itemCount: viewModel.bookLists.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                      title: getItem(viewModel.bookLists[position]),
                      onTap: () =>
                          onItemClick(context, viewModel.bookLists[position]),
                    );
                  });
            }
          });

  void onItemClick(BuildContext context, BookList list) {
    Navigator.pushNamed(context, BookDetailPage.routeName,
        arguments:
            BookDetailNavigationArguments(list.listName, list.listNameEncoded));
  }
}
