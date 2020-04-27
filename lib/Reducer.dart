import 'package:marvelapp/Actions.dart';
import 'package:marvelapp/AppState.dart';

AppState appStateReducer(AppState state, action) {
  if (action is FetchBookListsAction) {
    return new AppState(bookList: state.bookList, isFetching: true);
  }

  if (action is FetchBookListsSuccedAction) {
    return new AppState(bookList: action.bookLists, isFetching: false);
  }

  return new AppState(bookList: [], isFetching: false);
}
