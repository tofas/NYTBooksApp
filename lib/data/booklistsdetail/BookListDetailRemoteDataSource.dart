
import 'dart:convert';

import 'package:marvelapp/entities/BookListDetail.dart';
import 'package:marvelapp/resources/strings.dart';

import 'package:http/http.dart' as http;

class BookListDetailRemoteDataSource {

  Future<List<BookThumbnail>> load(String date, String listName) async {
    final response =
    await http.get(App.url + "lists/$date/$listName.json?api-key=" + App.nytAPIKey);
    if (response.statusCode == 200) {
      var bookListTypes = json.decode(response.body)['results']['books'] as List;
      return bookListTypes.map((item) => BookThumbnail.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}