import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:royalscouts/app/shared/layout/app_layout.dart';
import 'package:royalscouts/app/shared/widgets/banner/banner_01.dart';

import '../widgets/blog_card.dart';
import '../data/contact_us_datalist.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      bannerBackgroundImage: 'images/banner/banner-07.jpg',
      banner: Banner01(
        title: 'Contact Us',
      ),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: BootstrapRow(height: 60, children: <BootstrapCol>[
          BootstrapCol(
            sizes: 'col-sm-12 col-md-6',
            child: Column(
              children: List.generate(
                contactUsDataList.length,
                (index) {
                  return BlogCard(contactUsData: contactUsDataList[index]);
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
