import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/entities/BookListDetail.dart';
import 'package:marvelapp/reducers/AppState.dart';
import 'package:marvelapp/screens/bookview/BookViewDetail.dart';
import 'package:redux/redux.dart';

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
          });
}

class BookDetailPageViewModel {
  final String title;

  BookDetailPageViewModel(this.title);
}

class BookDetailGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BookDetailGridViewViewModel>(
          onInit: (store) => store
              .dispatch(FetchBookListDetailAction(store.state.selectedList)),
          converter: (store) => BookDetailGridViewViewModel(
              store.state.selectedListThumbnails, store.state.isFetching),
          builder: (context, viewModel) {
            if (viewModel.isFetching) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                  primary: false,
                  itemCount: viewModel.bookThumbnails.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                        child: InkWell(
                            onTap: () {
                              onBookClicked(context, index);
                            },
                            child: new GridTile(
                              footer: new GridTileBar(
                                backgroundColor: Colors.blue.withAlpha(200),
                                title: new Center(
                                    child: new Text(
                                        viewModel.bookThumbnails[index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                              ),
                              child: new Image.network(
                                viewModel.bookThumbnails[index].coverUrl,
                                fit: BoxFit.fitWidth,
                              ),
                            )));
                  });
            }
          } //just for testing, will fill with image later
          );

  void onBookClicked(BuildContext context, int selectedBook) {
    Store store = StoreProvider.of<AppState>(context);
    store.dispatch(OnBookSelectedAction(selectedBook));
    Navigator.pushNamed(context, BookViewDetail.routeName);
  }
}

class BookDetailGridViewViewModel {
  bool isFetching;
  List<BookThumbnail> bookThumbnails;

  BookDetailGridViewViewModel(this.bookThumbnails, this.isFetching);
}
