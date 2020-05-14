import 'dart:ffi';

class BookThumbnail {
  String title;
  String coverUrl;
  String description;
  int price;

  BookThumbnail(this.title, this.coverUrl, this.description, this.price);

  static BookThumbnail fromJson(Map<String, Object> json) {
    return BookThumbnail(json['title'] as String, json['book_image'] as String,
        json['description'] as String, json['price'] as int);
  }

  Map<String, Object> toJson() {
    return {
      'title': title,
      'book_image': coverUrl,
      'description': description,
      'price': price
    };
  }
}
