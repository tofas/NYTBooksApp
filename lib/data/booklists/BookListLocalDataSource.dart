import 'package:marvelapp/entities/BookLists.dart';

import '../core/Loadable.dart';
import '../core/Storable.dart';

class BookListLocalDataSource
    implements Loadable<List<BookList>>, Storable<List<BookList>> {
  @override
  Future<List<BookList>> load() {
    // TODO: implement load
    return null;
  }

  @override
  Future store(List<BookList> params) {
    // TODO: implement store
  }
}
