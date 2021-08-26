import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:royalscouts/app/modules/public/about/data/index.dart';
import 'package:royalscouts/app/modules/public/about/widgets/about_card.dart';

import 'package:royalscouts/app/shared/layout/app_layout.dart';
import 'package:royalscouts/app/shared/widgets/banner/banner_01.dart';
import 'package:royalscouts/app/shared/widgets/list/section_list.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      bannerBackgroundImage: 'images/banner/banner-05.jpg',
      banner: Banner01(
        title: 'About',
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 50,
          bottom: 50,
        ),
        child: BootstrapRow(
          children: <BootstrapCol>[
            BootstrapCol(
              sizes: 'col-sm-12 col-md-4',
              child: Column(
                children: [
                  SectionList('About', [
                    'History',
                    'Patrol Leaders’ Council',
                    'Group Scout Leaders',
                    'Scout Leaders',
                    'Senior Troop Leaders',
                    'President’s Scouts',
                    'Patrol Leaders’ Council',
                    'Management',
                    'Lt. Col. M.K.J Cantlay',
                    'Challenge Shield'
                  ]),
                  SizedBox(height: 25.0),
                ],
              ),
            ),
            BootstrapCol(
              sizes: 'col-sm-12 col-md-8',
              child: Column(
                children: List.generate(
                  aboutDataList.length,
                  (index) {
                    return AboutCard(aboutData: aboutDataList[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
