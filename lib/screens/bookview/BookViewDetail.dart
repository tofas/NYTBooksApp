import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/reducers/AppState.dart';

class BookViewDetail extends StatelessWidget {
  static const routeName = 'book';

  BookViewDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BookViewDetailViewModel>(
          converter: (store) => BookViewDetailViewModel(store
              .state.selectedListThumbnails[store.state.selectedBook].title),
          builder: (context, viewModel) {
            return new Scaffold(
                appBar: AppBar(title: Text(viewModel.title)),
                body: new Text(viewModel.title));
          });
}

class BookViewDetailViewModel {
  final String title;

  BookViewDetailViewModel(this.title);
}
