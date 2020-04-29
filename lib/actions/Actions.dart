import 'package:marvelapp/entities/BookLists.dart';

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

class FetchBookListDetailAction {

}
