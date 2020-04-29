import 'dart:convert';

import 'package:marvelapp/entities/BookListType.dart';
import 'package:path_provider/path_provider.dart';

import '../core/Loadable.dart';
import '../core/Storable.dart';
import 'dart:io';

class BookListTypeLocalDataSource
    implements Loadable<List<BookListType>>, Storable<List<BookListType>> {
  @override
  Future<List<BookListType>> load() async {
    final file = await localFile;
    final string = await file.readAsString();
    final bookListTypes = jsonDecode(string)
        .map<BookListType>((types) => BookListType.fromJson(types))
        .toList();
    return bookListTypes;
  }

  @override
  Future store(List<BookListType> params) async {
    final file = await localFile;

    return file.writeAsString(
        jsonEncode(params.map((type) => type.toJson()).toList()));
  }

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final directory = await localPath;
    return File('$directory/BookListTypes.json');
  }
}
