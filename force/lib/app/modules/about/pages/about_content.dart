import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:force/app/shared/layout/app_layout.dart';
import 'package:force/app/shared/widgets/banner/banner_01.dart';
import 'package:force/app/shared/widgets/list/section_list.dart';

@override
Widget build(BuildContext context) {
  return AppLayout(
    bannerBackgroundImage: 'images/banner/banner-05.jpg',
    banner: Banner01(
      title: 'About',
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 70.0),
      child: Column(
        children: [
          BootstrapRow(height: 60, children: <BootstrapCol>[
            BootstrapCol(
              sizes: 'col-sm-12 col-md-4',
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Column(
                  children: [
                    SizedBox(height: 50.0),
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
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    ),
  );
}
