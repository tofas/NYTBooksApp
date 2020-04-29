import 'package:marvelapp/entities/BookListType.dart';

class FetchBookListsAction {}

class FetchBookListsSuccedAction {
  List<BookListType> bookLists;

  FetchBookListsSuccedAction(List<BookListType> booklists) {
    this.bookLists = booklists;
  }
}

class FetchBookListsFailedAction {
  Exception error;

  FetchBookListsFailedAction(Exception error) {
    this.error = error;
  }
}

class FetchBookListDetailAction {

}
