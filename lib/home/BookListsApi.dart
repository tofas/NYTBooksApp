import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvelapp/resources/strings.dart';


class BookListApi {

  Future<List<BookList>> fetchBookLists() async {
    final response =
    await http.get(App.url + "lists/names.json?api-key=" + App.nytAPIKey);

    if (response.statusCode == 200) {
      var httpresponse = json.decode(response.body)['results'] as List;
      return httpresponse.map((item) => BookList.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}

class BookList {
  String listName;
  String listNameEncoded;

  BookList({this.listName, this.listNameEncoded});

  factory BookList.fromJson(Map<String, dynamic> json) {
    return BookList(
        listName: json['list_name'],
        listNameEncoded: json['list_name_encoded']);
  }
}
