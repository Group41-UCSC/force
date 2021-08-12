import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:force/app/modules/news/widgets/related_posts.dart';
import 'package:force/app/shared/layout/app_layout.dart';
import 'package:force/app/shared/widgets/list/section_list.dart';
import 'package:force/app/shared/widgets/banner/banner_01.dart';

class NewsContent extends StatelessWidget {
  final String? bannerTitle;
  final List<String>? contents;
  final List<String>? contentImageUrls;

  const NewsContent({
    Key? key,
    this.contents,
    this.contentImageUrls,
    this.bannerTitle,
  }) : super(key: key);

  List<Widget> _getContent() {
    var widgetList = <Widget>[];

    widgetList.add(SizedBox(height: 50.0));

    for (var content in contents!) {
      // Add list item
      widgetList.add(
        Text(
          content,
          softWrap: true,
          style: TextStyle(
            color: Color(0xff555555),
            height: 1.8,
            fontSize: 16.5,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
      // Add space between items
      widgetList.add(SizedBox(height: 15.0));
    }

    widgetList.add(SizedBox(height: 25.0));

    for (var contentImageUrl in contentImageUrls!) {
      // Add list item
      widgetList.add(
        Image.asset(
          contentImageUrl,
          fit: BoxFit.cover,
        ),
      );
      // Add space between items
      widgetList.add(SizedBox(height: 20.0));
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      bannerBackgroundImage: 'images/banner/banner-01.jpg',
      banner: Banner01(
        title: bannerTitle ?? '',
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 70.0),
            child: BootstrapRow(
              height: 60,
              children: <BootstrapCol>[
                BootstrapCol(
                  sizes: 'col-sm-12 col-md-8',
                  child: Column(children: _getContent()),
                ),
                BootstrapCol(
                  sizes: 'col-sm-12 col-md-4',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50.0),
                        SectionList('Recent Posts', [
                          'Inauguration of celebrations commemorating 75 years of Scouting at Royal College, Colombo',
                          '2019, the Celebration of 75 years of Scouting in Royal College',
                          'Troop Expedition to Hanthana Mountain Range',
                          '“Leave No Trace” Workshop',
                          'Annual General Meeting of Royal College Old Scouts Association 2019/2020'
                        ]),
                        SizedBox(height: 25.0),
                        SectionList('Recent Comments', [
                          'Yasith Randila on 29th Asia Pacific Regional & Sri Lanka Centenary Jamboree',
                          'thanuka nethmina on Awurudu Uthsawaya 2012',
                          'scouting magazine on Patrol Leaders’ & Instructors’ Training Camp 2012'
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          RelatedPosts()
        ],
      ),
    );
  }
}
