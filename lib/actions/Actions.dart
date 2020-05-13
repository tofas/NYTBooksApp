import 'package:marvelapp/entities/BookListDetail.dart';
import 'package:marvelapp/entities/BookListType.dart';

class FetchBookListsAction {}

class FetchBookListsSuccedAction {
  List<BookListType> bookLists;

  FetchBookListsSuccedAction(this.bookLists);
}

class FetchBookListsFailedAction {
  Exception error;

  FetchBookListsFailedAction(this.error);
}

class OnBookListSelectedAction {
  BookListType selectedList;

  OnBookListSelectedAction(this.selectedList);
}

class FetchBookListDetailAction {
  BookListType selectedList;

  FetchBookListDetailAction(this.selectedList);
}

class FetchBookListDetailSucceedAction {
  List<BookThumbnail> bookThumbnails;

  FetchBookListDetailSucceedAction(this.bookThumbnails);
}

class FetchBookListDetailFailedAction {
  Exception error;

  FetchBookListDetailFailedAction(this.error);
}