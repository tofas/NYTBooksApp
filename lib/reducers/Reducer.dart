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
        bookList: state.bookList, selectedList: action.selectedList);
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

  if (action is OnBookSelectedAction) {
    return new AppState(bookList: state.bookList,
        selectedList: state.selectedList,
        selectedListThumbnails: state.selectedListThumbnails,
        selectedBook: state.selectedListThumbnails[action.selectedBook]);
  }

  return new AppState();
}
