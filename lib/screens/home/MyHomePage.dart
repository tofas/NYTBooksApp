import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/entities/BookListType.dart';
import 'package:marvelapp/reducers/AppState.dart';
import 'package:marvelapp/resources/strings.dart';
import 'package:marvelapp/screens/bookdetail/BookDetailPage.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:redux/redux.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = 'home';

  MyHomePage({Key key}) : super(key: key);

  final String title = HomePage.home_page_title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)), body: new BookListTypeView());
  }
}

class BookListsTypeViewModel {
  bool isFetching;
  List<BookListType> bookLists;

  BookListsTypeViewModel(this.bookLists, this.isFetching);
}

class BookListTypeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BookListsTypeViewModel>(
          onInit: (store) => store.dispatch(FetchBookListsAction()),
          converter: (store) => BookListsTypeViewModel(
              store.state.bookList, store.state.isFetching),
          builder: (context, viewModel) {
            if (viewModel.isFetching) {
              return Center(child: PlatformCircularProgressIndicator());
            } else {
              return new ListView.builder(
                  itemCount: viewModel.bookLists.length,
                  itemBuilder: (context, position) {
                    return NativeListTile(
                      title: Text(viewModel.bookLists[position].listName),
                      ios: CupertinoListTileData(
                        style: CupertinoCellStyle.subtitle,
                        accessory: CupertinoAccessory.disclosureIndicator
                      ),
                      onTap: () =>
                          onItemClick(context, viewModel.bookLists[position]),
                    );
                  });
            }
          });

  void onItemClick(BuildContext context, BookListType list) {
    Store store = StoreProvider.of<AppState>(context);
    store.dispatch(OnBookListSelectedAction(list));
    Navigator.pushNamed(context, BookDetailPage.routeName);
  }
}
