import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/data/booklists/BookListTypeRepositoryImpl.dart';
import 'package:marvelapp/data/booklistsdetail/BookListDetailRepository.dart';
import 'package:redux/redux.dart';

import '../reducers/AppState.dart';

List<Middleware<AppState>> createBookListTypeMiddleware(
    BookListTypeRepositoryImpl bookListTypeRepository,
    BookListDetailRepository bookListDetailRepository) {
  final fetchMiddleware = fetchBookListTypeMiddleware(bookListTypeRepository);
  final fetchThumbnailsMiddleware =
      fetchBookListDetailMiddleware(bookListDetailRepository);
  return [
    TypedMiddleware<AppState, FetchBookListsAction>(fetchMiddleware),
    TypedMiddleware<AppState, FetchBookListDetailAction>(
        fetchThumbnailsMiddleware)
  ];
}

Middleware<AppState> fetchBookListTypeMiddleware(
    BookListTypeRepositoryImpl repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    try {
      repository.loadBookLists().then((bookListTypeList) {
        store.dispatch(FetchBookListsSuccedAction(bookListTypeList));
      });
    } catch (e) {
      store.dispatch(FetchBookListsFailedAction(e));
    }

    next(action);
  };
}

Middleware<AppState> fetchBookListDetailMiddleware(
    BookListDetailRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    try {
      repository
          .loadBookListsDetail(store.state.selectedList.listNameEncoded)
          .then((bookListDetailList) {
        store.dispatch(FetchBookListDetailSucceedAction(bookListDetailList));
      });
    } catch (e) {
      store.dispatch(FetchBookListDetailFailedAction(e));
    }

    next(action);
  };
}
