import 'package:marvelapp/Actions.dart';
import 'package:marvelapp/home/BookListsApi.dart';
import 'package:redux/redux.dart';

import 'AppState.dart';

void fetchBookListMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchBookListsAction) {
    final api = new BookListApi();
    api.fetchBookLists().then((List<BookList> bookLists) {
      store.dispatch(new FetchBookListsSuccedAction(bookLists));
    }).catchError((Object error) {
      store.dispatch(new FetchBookListsFailedAction(error));
    });
  }

  next(action);
}
