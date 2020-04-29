import 'package:marvelapp/entities/BookListType.dart';

class AppState {
  List<BookListType> bookList;
  bool isFetching;

  AppState({
    this.bookList = const [],
    this.isFetching = false
  });
}