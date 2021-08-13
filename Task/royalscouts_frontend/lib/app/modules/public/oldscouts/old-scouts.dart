import 'package:flutter/cupertino.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:royalscouts/app/modules/public/oldscouts/widgets/officebearer/office-bearer.dart';
import 'package:royalscouts/app/modules/public/oldscouts/widgets/oldscoutnews/old-scout-news.dart';
import 'package:royalscouts/app/shared/layout/app_layout.dart';
import 'package:royalscouts/app/shared/widgets/banner/banner_01.dart';

class OldScouts extends StatefulWidget {
  OldScouts({Key? key}) : super(key: key);

  @override
  _OldScoutsState createState() => _OldScoutsState();
}

class _OldScoutsState extends State<OldScouts> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        bannerHeight: 500.0,
        bannerBackgroundImage: 'images/oldscout/scout.jpg',
        banner: Banner01(title: 'Old Scouts'),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 80, 40, 80),
          child: BootstrapRow(
            children: [
              BootstrapCol(sizes: 'col-md-6', child: OfficeBearers()),
              BootstrapCol(sizes: 'col-md-6', child: OldScoutNews())
            ],
          ),
        ));
  }
}
