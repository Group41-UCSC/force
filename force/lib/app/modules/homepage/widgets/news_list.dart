import 'package:flutter/material.dart';
import 'package:force/app/modules/news/data/news_datalist.dart';
import 'package:force/app/shared/widgets/news/news_tile.dart';

class NewsList extends StatefulWidget {
  NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 570,
          childAspectRatio: 0.75,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: 3,
      itemBuilder: (BuildContext context, index) {
        return NewsTile(newsData: newsDataList[index]);
      },
    );
  }
}
