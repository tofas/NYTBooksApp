import 'package:marvelapp/home/BookListsApi.dart';

class FetchBookListsAction {}

class FetchBookListsSuccedAction {
  List<BookList> bookLists;

  FetchBookListsSuccedAction(List<BookList> booklists) {
    this.bookLists = booklists;
  }
}

class FetchBookListsFailedAction {
  Exception error;

  FetchBookListsFailedAction(Exception error) {
    this.error = error;
  }
}
