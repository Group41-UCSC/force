import 'package:flutter/cupertino.dart';

class NewsModel {
  final String imageUrl;
  final String heading;
  final String title;
  final String subtitle;
  final Color fontColor;

  NewsModel(
      {required this.imageUrl,
      required this.heading,
      required this.title,
      required this.subtitle,
      required this.fontColor});
}
