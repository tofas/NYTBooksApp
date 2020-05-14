
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/data/booklists/BookListTypeLocalDataSource.dart';
import 'package:marvelapp/data/booklists/BookListTypeRemoteDataSource.dart';
import 'package:marvelapp/data/booklists/BookListTypeRepositoryImpl.dart';
import 'package:marvelapp/data/booklistsdetail/BookListDetailRemoteDataSource.dart';
import 'package:marvelapp/data/booklistsdetail/BookListDetailRepository.dart';
import 'package:marvelapp/middleware/Middleware.dart';
import 'package:marvelapp/reducers/Reducer.dart';
import 'package:marvelapp/screens/bookdetail/BookDetailPage.dart';
import 'package:marvelapp/screens/bookview/BookViewDetail.dart';
import 'package:marvelapp/screens/home/MyHomePage.dart';
import 'package:redux/redux.dart';

import 'reducers/AppState.dart';
import 'resources/strings.dart';

void main() {
  final store = new Store(
    appStateReducer,
    initialState: new AppState(),
    middleware: createBookListTypeMiddleware(
        BookListTypeRepositoryImpl(
            BookListTypeLocalDataSource(), BookListTypeRemoteDataSource()),
        BookListDetailRepository(BookListDetailRemoteDataSource())),
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: new MaterialApp(
          title: App.name,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: MyHomePage.routeName,
          routes: {
            MyHomePage.routeName: (context) => MyHomePage(),
            BookDetailPage.routeName: (context) => BookDetailPage(),
            BookViewDetail.routeName: (context) => BookViewDetail()
          },
        ));
  }
}
