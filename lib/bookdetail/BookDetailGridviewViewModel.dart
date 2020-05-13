import 'package:marvelapp/entities/BookListDetail.dart';

class BookDetailGridViewViewModel {
  bool isFetching;
  List<BookThumbnail> bookThumbnails;

  BookDetailGridViewViewModel(this.bookThumbnails, this.isFetching);
}