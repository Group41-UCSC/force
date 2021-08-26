import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:force/app/modules/about/data/index.dart';

class AboutCard extends StatelessWidget {
  final AboutData aboutData;

  const AboutCard({Key? key, required this.aboutData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 70.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Text(
            aboutData.aboutTitle,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Text(
            aboutData.aboutBody,
            softWrap: true,
            style: TextStyle(
              color: Color(0xff555555),
              height: 1.8,
              fontSize: 16.5,
              fontWeight: FontWeight.w300,
            ),
          ),
          RichText(
            softWrap: true,
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xff3c4858),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
