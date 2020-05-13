import 'package:marvelapp/actions/Actions.dart';
import 'package:marvelapp/reducers/AppState.dart';

AppState appStateReducer(AppState state, action) {
  if (action is FetchBookListsAction) {
    return new AppState(bookList: state.bookList, isFetching: true);
  }

  if (action is FetchBookListsSuccedAction) {
    return new AppState(bookList: action.bookLists, isFetching: false);
  }

  if (action is OnBookListSelectedAction) {
    return new AppState(
        bookList: state.bookList, selectedList: action.selectedListName);
  }

  if (action is FetchBookListDetailAction) {
    return new AppState(
        bookList: state.bookList,
        isFetching: true,
        selectedList: action.selectedList);
  }

  if (action is FetchBookListDetailSucceedAction) {
    return new AppState(
        bookList: state.bookList,
        isFetching: false,
        selectedList: state.selectedList,
        selectedListThumbnails: action.bookThumbnails);
  }

  return new AppState();
}
