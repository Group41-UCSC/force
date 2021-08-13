import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:force/app/modules/contact_us/models/contact-us_data.dart';

class BlogCard extends StatefulWidget {
  final ContactUsData contactUsData;

  const BlogCard({Key? key, required this.contactUsData}) : super(key: key);

  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];

    for (var text in widget.contactUsData.contactusBody) {
      widgetList.add(Container(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xff555555),
            height: 1.8,
            fontSize: 16.5,
            fontWeight: FontWeight.w300,
          ),
        ),
      ));

      widgetList.add(SizedBox(height: 10.0));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Center(
        child: BootstrapRow(
          height: 60,
          children: <BootstrapCol>[
            BootstrapCol(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    widget.contactUsData.contactusTitle,
                    style: TextStyle(
                      fontSize: 16.5,
                      color: Color(0xff3c4858),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ...widgetList,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
