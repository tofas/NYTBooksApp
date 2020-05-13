import 'package:marvelapp/entities/BookListDetail.dart';

import 'BookListDetailRemoteDataSource.dart';

class BookListDetailRepository {
  BookListDetailRemoteDataSource bookListRemoteDataSource;

  BookListDetailRepository(this.bookListRemoteDataSource);

  Future<List<BookThumbnail>> loadBookListsDetail(String listName) async {
    final bookList = await bookListRemoteDataSource.load('current', listName);
    return bookList;
  }
}
