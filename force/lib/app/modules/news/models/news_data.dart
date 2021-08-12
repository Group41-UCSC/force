import 'dart:ui';

class NewsData {
  String imageUrl;
  String newsTitle;
  Color postTitleColor;
  String postTitle;
  String newsBody;
  String author;
  String modifiedDate;
  List<String> contents;
  List<String> contentImageUrls;

  NewsData(
      {required this.imageUrl,
      required this.contents,
      required this.contentImageUrls,
      required this.newsTitle,
      required this.postTitleColor,
      required this.postTitle,
      required this.newsBody,
      required this.author,
      required this.modifiedDate});
}
