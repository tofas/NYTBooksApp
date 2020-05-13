import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/bookdetail/BookDetailGridview.dart';
import 'package:marvelapp/reducers/AppState.dart';

class BookDetailPage extends StatelessWidget {
  static const routeName = 'detail';

  BookDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BookDetailPageViewModel>(
          converter: (store) =>
              BookDetailPageViewModel(store.state.selectedList.listName),
          builder: (context, viewModel) {
            return new Scaffold(
                appBar: AppBar(title: Text(viewModel.title)),
                body: new BookDetailGridView());
          }
      );
}

class BookDetailPageViewModel {
  final String title;

  BookDetailPageViewModel(this.title);
}
