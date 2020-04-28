import 'package:marvelapp/home/BookListsApi.dart';

class BookListsViewModel {
  bool isFetching;
  List<BookList> bookLists;

  BookListsViewModel(this.bookLists, this.isFetching);
}
