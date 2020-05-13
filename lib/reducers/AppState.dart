import 'package:marvelapp/entities/BookListDetail.dart';
import 'package:marvelapp/entities/BookListType.dart';

class AppState {
  List<BookListType> bookList;
  bool isFetching;
  String selectedList;
  List<BookThumbnail> selectedListThumbnails;

  AppState({
    this.bookList = const [],
    this.isFetching = false,
    this.selectedList = "",
    this.selectedListThumbnails = const []
  });
}