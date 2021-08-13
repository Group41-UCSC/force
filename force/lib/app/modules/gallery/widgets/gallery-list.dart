import 'package:flutter/material.dart';
import 'package:force/app/modules/gallery/data/gallery-data.dart';
import 'package:force/app/modules/gallery/models/gallery-model.dart';
import 'package:force/app/shared/widgets/nav_link.dart';

class GalleryList extends StatefulWidget {
  GalleryList({Key? key}) : super(key: key);

  @override
  _GalleryListState createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  Widget _galleryList(GalleryModel gallery) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: NavLink(
            fontSize: 41.6,
            text: gallery.title,
            fontWeight: FontWeight.w300,
            defaultColor: Color(0xff3c4858),
            onHoverColor: Color(0xff20167a),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: Icon(
              Icons.fiber_manual_record,
              size: 15.0,
              color: Color(0xff3c4858),
            ),
            title: Text(gallery.subtitle),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: galleryList.length,
        itemBuilder: (context, index) {
          return _galleryList(galleryList[index]);
        });
  }
}
