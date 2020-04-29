import 'package:marvelapp/data/booklists/BookListTypeLocalDataSource.dart';
import 'package:marvelapp/data/booklists/BookListTypeRemoteDataSource.dart';
import 'package:marvelapp/entities/BookListType.dart';


class BookListTypeRepositoryImpl {
  BookListTypeLocalDataSource bookListLocalDataSource;
  BookListTypeRemoteDataSource bookListRemoteDataSource;

  BookListTypeRepositoryImpl(
      this.bookListLocalDataSource, this.bookListRemoteDataSource);

  Future<List<BookListType>> loadBookLists() async {
    try {
      return await bookListLocalDataSource.load();
    } catch(e) {
      final bookList = await bookListRemoteDataSource.load();
      await bookListLocalDataSource.store(bookList);
      return bookList;
    }
  }

  Future saveBookLists(List<BookListType> bookList) async {
    return await bookListLocalDataSource.store(bookList);
  }
}
