
class BookThumbnail {
  String title;
  String coverUrl;

  BookThumbnail(this.title, this.coverUrl);

  static BookThumbnail fromJson(Map<String, Object> json) {
    return BookThumbnail(
        json['title'] as String,
        json['book_image'] as String);
  }

  Map<String, Object> toJson() {
    return {
      'title': title,
      'book_image': coverUrl
    };
  }
}