import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/entities/BookListDetail.dart';
import 'package:marvelapp/reducers/AppState.dart';

class BookViewDetail extends StatelessWidget {
  static const routeName = 'book';

  BookViewDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BookViewDetailViewModel>(
          converter: (store) => BookViewDetailViewModel(
              store.state.selectedBook.title,
              store.state.selectedBook.coverUrl,
              store.state.selectedBook.description),
          builder: (context, viewModel) {
            return new Scaffold(
              appBar: AppBar(title: Text(viewModel.title)),
              body: Column(
                children: <Widget>[
                  Image.network(
                    viewModel.imageUrl,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Container(
                      margin: EdgeInsets.all(16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(viewModel.title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold))
                          ])),
                  Container(
                      margin: EdgeInsets.all(16),
                      child: Text(viewModel.description,
                          style: TextStyle(fontSize: 16)))
                ],
              ),
            );
          });
}

class BookViewDetailViewModel {
  final String title;
  final String imageUrl;
  final String description;

  BookViewDetailViewModel(this.title, this.imageUrl, this.description);
}
