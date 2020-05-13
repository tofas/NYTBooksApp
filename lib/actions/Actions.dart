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
  String selectedListName;

  OnBookListSelectedAction(this.selectedListName);
}

class FetchBookListDetailAction {
  String selectedList;

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