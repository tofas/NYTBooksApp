import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/entities/BookListDetail.dart';
import 'package:marvelapp/entities/BookListType.dart';
import 'package:marvelapp/reducers/AppState.dart';

import 'BookDetailGridviewViewModel.dart';

class BookDetailGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState,
          BookDetailGridViewViewModel>(
      onInit: (store) =>
          store.dispatch(FetchBookListDetailAction(store.state.selectedList)),
      converter: (store) => BookDetailGridViewViewModel(
          store.state.selectedListThumbnails, store.state.isFetching),
      builder: (context, viewModel) {
        if (viewModel.isFetching) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
              primary: false,
              itemCount: viewModel.bookThumbnails.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    child: new GridTile(
                  footer: new GridTileBar(
                    backgroundColor: Colors.blue.withAlpha(200),
                    title: new Center(
                        child: new Text(viewModel.bookThumbnails[index].title,
                            style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold))),
                  ),
                  child: new Image.network(
                    viewModel.bookThumbnails[index].coverUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ));
              });
        }
      } //just for testing, will fill with image later
      );
}
