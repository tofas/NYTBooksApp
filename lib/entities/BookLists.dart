
class BookList {
  String listName;
  String listNameEncoded;

  BookList(this.listName, this.listNameEncoded);

  static BookList fromJson(Map<String, Object> json) {
    return BookList(
        json['list_name'] as String,
        json['list_name_encoded'] as String);
  }

  Map<String, Object> toJson() {
    return {
      'list_name': listName,
      'list_name_encoded': listNameEncoded
    };
  }
}