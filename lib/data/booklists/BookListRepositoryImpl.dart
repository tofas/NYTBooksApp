import 'package:marvelapp/data/booklists/BookListLocalDataSource.dart';
import 'package:marvelapp/data/booklists/BookListRemoteDataSource.dart';
import 'package:marvelapp/entities/BookLists.dart';

import 'BookListRepository.dart';

class BookListRepositoryImpl implements BookListRepository {
  BookListLocalDataSource bookListLocalDataSource;
  BookListRemoteDataSource bookListRemoteDataSource;

  BookListRepositoryImpl(
      this.bookListLocalDataSource, this.bookListRemoteDataSource);

  @override
  Future<List<BookList>> loadBookLists() async {
    try {
      return await bookListLocalDataSource.load();
    } catch(e) {
      final bookList = await bookListRemoteDataSource.load();
      await bookListLocalDataSource.store(bookList);
      return bookList;
    }
  }

  @override
  Future saveBookLists(List<BookList> bookList) async {
    return await bookListLocalDataSource.store(bookList);
  }
}
