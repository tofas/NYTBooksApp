import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/bookdetail/BookDetailPage.dart';
import 'package:marvelapp/home/BookListsView.dart';
import 'package:marvelapp/middleware/Middleware.dart';
import 'package:marvelapp/reducers/Reducer.dart';
import 'package:redux/redux.dart';

import 'reducers/AppState.dart';
import 'home/home_page.dart';
import 'resources/strings.dart';

void main() {
  final store = new Store(
    appStateReducer,
    initialState: new AppState(),
    middleware: [fetchBookListMiddleware],
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
            initialRoute: 'home',
            routes: {
              MyHomePage.routeName: (context) => MyHomePage(),
              BookDetailPage.routeName: (context) => BookDetailPage()
            },
        ));
  }
}
