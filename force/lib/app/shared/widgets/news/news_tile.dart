import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:force/app/modules/news/models/news_data.dart';

class NewsTile extends StatelessWidget {
  final NewsData newsData;
  final double? elevation;

  const NewsTile({Key? key, required this.newsData, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            child: Image.asset('${newsData.imageUrl}'),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 20, left: 15),
            child: Text(
              '${newsData.postTitle}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: newsData.postTitleColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Text(
              '${newsData.newsTitle}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.8),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: ReadMoreText(
              newsData.newsBody,
              trimLines: 3,
              colorClickableText: Colors.blue[200],
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                color: Colors.blue[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}