import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:force/app/shared/layout/app_layout.dart';
import 'package:force/app/shared/widgets/banner/banner_01.dart';

import '../widgets/news_card.dart';
import '../../../shared/widgets/list/section_list.dart';
import '../data/news_datalist.dart';

class News extends StatefulWidget {
  News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      bannerBackgroundImage: 'images/banner/banner-01.jpg',
      banner: Banner01(
        title:
            'The Official Website of the 42nd Colombo Royal College Scout Group',
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 70.0, top: 50),
        child: BootstrapRow(
          height: 60,
          children: <BootstrapCol>[
            BootstrapCol(
              sizes: 'col-sm-12 col-md-8',
              child: Column(
                children: List.generate(
                  newsDataList.length,
                  (index) {
                    return NewsCard(newsData: newsDataList[index]);
                  },
                ),
              ),
            ),
            BootstrapCol(
              sizes: 'col-sm-12 col-md-4',
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Column(
                  children: [
                    SectionList(
                      'Recent Posts',
                      [
                        'Inauguration of celebrations commemorating 75 years of Scouting at Royal College, Colombo',
                        '2019, the Celebration of 75 years of Scouting in Royal College',
                        'Troop Expedition to Hanthana Mountain Range',
                        '“Leave No Trace” Workshop',
                        'Annual General Meeting of Royal College Old Scouts Association 2019/2020'
                      ],
                    ),
                    SizedBox(height: 25.0),
                    SectionList(
                      'Recent Comments',
                      [
                        'Yasith Randila on 29th Asia Pacific Regional & Sri Lanka Centenary Jamboree',
                        'thanuka nethmina on Awurudu Uthsawaya 2012',
                        'scouting magazine on Patrol Leaders’ & Instructors’ Training Camp 2012'
                      ],
                    ),
                    SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
