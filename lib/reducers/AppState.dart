import 'package:marvelapp/home/BookListsApi.dart';

class AppState {
  List<BookList> bookList;
  bool isFetching;

  AppState({
    this.bookList = const [],
    this.isFetching = false
  });
}