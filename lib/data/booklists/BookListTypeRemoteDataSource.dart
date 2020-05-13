import 'dart:convert';

import 'package:marvelapp/entities/BookListType.dart';
import 'package:marvelapp/resources/strings.dart';
import 'package:http/http.dart' as http;

class BookListTypeRemoteDataSource {

  Future<List<BookListType>> load() async {
    final response =
        await http.get(App.url + "lists/names.json?api-key=" + App.nytAPIKey);
    if (response.statusCode == 200) {
      var bookListTypes = json.decode(response.body)['results'] as List;
      return bookListTypes.map((item) => BookListType.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
