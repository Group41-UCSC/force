import 'package:flutter/material.dart';
import 'package:force/app/modules/homepage/models/news-model.dart';

final List<String> imgList = [
  '/images/banner/banner-02.jpg',
  '/images/homepage/slider.JPG',
];

final List<NewsModel> newsList = [
  new NewsModel(
      imageUrl: '/images/homepage/75aniv.jpg',
      heading: '75TH CELEBRATION',
      title:
          'Inauguration of celebrations commemorating 75 years of Scouting at Royal College, Colombo',
      subtitle:
          'The celebrations to commemorate 75 years of the Scouting movement at Royal College Colombo was inaugurated on Tuesday the 17th of September 2019 at 7.45 am in the Royal College Boardroom with the participation of',
      fontColor: Color.fromRGBO(32, 22, 122, 1)),
  new NewsModel(
      imageUrl: '/images/banner/banner-02.jpg',
      heading: '75TH CELEBRATION',
      title: '2019, the Celebration of 75 years of Scouting in Royal College',
      subtitle:
          'This is a story that had been told every year, when every new bunch of excited kids gather around the campfire with their hearts beating aloud, eyes blazing with the scouts spirit, with great aspirations',
      fontColor: Color.fromRGBO(0, 188, 212, 1)),
  new NewsModel(
    imageUrl: '/images/homepage/scout.jpeg',
    heading: 'SCOUTING',
    title: 'Troop Expedition to Hanthana Mountain Range',
    subtitle:
        'Under the Jubilee Celebration theme “Adventure and Fun”, the Instructors of Gold Troop took the initiative to relive the old practice of annual Trip by organizing a hike to the famous Hanthana mountain range on',
    fontColor: Color.fromRGBO(244, 67, 54, 1),
  ),
];
