import 'package:marvelapp/entities/BookListType.dart';

class BookListsTypeViewModel {
  bool isFetching;
  List<BookListType> bookLists;

  BookListsTypeViewModel(this.bookLists, this.isFetching);
}
