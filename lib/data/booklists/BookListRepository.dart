import 'package:marvelapp/entities/BookLists.dart';

abstract class BookListRepository {
  Future<List<BookList>> loadBookLists();

  Future saveBookLists(List<BookList> bookList);
}