import 'package:flutter/material.dart';
import 'package:royalscouts/app/modules/public/gallery/widgets/gallery-list.dart';
import 'package:royalscouts/app/shared/layout/app_layout.dart';
import 'package:royalscouts/app/shared/widgets/banner/banner_01.dart';

class Gallery extends StatefulWidget {
  Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      bannerBackgroundImage: 'images/banner/banner-01.jpg',
      banner: Banner01(
        title: 'Image Gallery',
      ),
      child:  Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50,left: 100),
          child: GalleryList(),
        ),

    );
  }
}
