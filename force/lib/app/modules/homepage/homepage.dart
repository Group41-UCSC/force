import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:force/app/shared/layout/app_layout.dart';
import 'package:force/app/modules/homepage/widgets/get_in_touch.dart';
import 'package:force/app/modules/homepage/widgets/news_list.dart';
import 'package:force/app/shared/widgets/banner/banner_02.dart';

import 'data/homepage-data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      bannerHeight: 500.0,
      bannerBackgroundImage: 'images/banner/banner-03.jpg',
      banner: Banner02(
        title: 'RoyalScouts',
        subTitle: '42nd Colombo Royal College Gold Troop',
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(40, 27, 153, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/about');
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "ABOUT",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 40, bottom: 40),
            padding: const EdgeInsets.all(20),
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  height: 400.0,
                  autoPlayInterval: Duration(seconds: 10)),
              items: imgList.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 41.6),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: Text(
              "We will endeavour to keep you updated here with the latest News related to RoyalScouts",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 600,
            padding: const EdgeInsets.all(20),
            child: NewsList(),
          ),
          Container(
            height: 517,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/banner/banner-06.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: GetInTouch(),
            ),
          ),
        ],
      ),
    );
  }
}
