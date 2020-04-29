import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/data/booklists/BookListTypeRepositoryImpl.dart';
import 'package:redux/redux.dart';

import '../reducers/AppState.dart';

Middleware<AppState> createBookListTypeMiddleware(BookListTypeRepositoryImpl repository) {
  final fetchMiddleware = fetchBookListTypeMiddleware(repository);
  return TypedMiddleware<AppState, FetchBookListsAction>(fetchMiddleware);
}

Middleware<AppState> fetchBookListTypeMiddleware(
    BookListTypeRepositoryImpl repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    try {
      repository.loadBookLists().then((bookListTypeList) {
        store.dispatch(FetchBookListsSuccedAction(bookListTypeList));
      });
    } catch(e) {
      store.dispatch(FetchBookListsFailedAction(e));
    }

    next(action);
  };

}
