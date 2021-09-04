import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:royalscouts/app/modules/public/news/data/news_datalist.dart';
import 'package:royalscouts/app/shared/widgets/news/news_tile.dart';

class RelatedPosts extends StatelessWidget {
  const RelatedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 500,
        color: Color(0xffe5e5e5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Related Posts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            BootstrapRow(
              children: [
                BootstrapCol(
                  sizes: 'col-sm-12 col-md-4',
                  child: NewsTile(newsData: newsDataList[1]),
                )
              ],
            )
          ],
        ));
  }
}
