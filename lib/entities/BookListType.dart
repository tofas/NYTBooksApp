
class BookListType {
  String listName;
  String listNameEncoded;

  BookListType(this.listName, this.listNameEncoded);

  static BookListType fromJson(Map<String, Object> json) {
    return BookListType(
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