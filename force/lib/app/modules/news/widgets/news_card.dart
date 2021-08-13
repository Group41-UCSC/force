import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:force/app/modules/news/models/news_data.dart';
import 'package:force/app/modules/news/pages/news_content.dart';
import 'package:force/app/shared/widgets/nav_link.dart';

class NewsCard extends StatefulWidget {
  final NewsData newsData;

  const NewsCard({Key? key, required this.newsData}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75.0),
      child: BootstrapRow(
        height: 60,
        children: <BootstrapCol>[
          widget.newsData.imageUrl != ''
              ? BootstrapCol(
                  sizes: 'col-sm-12 col-md-5',
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Image.asset(
                      widget.newsData.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                )
              : BootstrapCol(
                  child: SizedBox(),
                ),
          BootstrapCol(
            sizes: widget.newsData.imageUrl != ''
                ? 'col-sm-12 col-md-7'
                : 'col-12',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  widget.newsData.postTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: widget.newsData.postTitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                NavLink(
                  text: widget.newsData.newsTitle,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  defaultColor: Color(0xff3c4858),
                  onHoverColor: Color(0xff20167a),
                  onClick: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsContent(
                          bannerTitle: widget.newsData.newsTitle,
                          contents: widget.newsData.contents,
                          contentImageUrls: widget.newsData.contentImageUrls,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12.0),
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xff3c4858),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.newsData.newsBody,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: ' Read more...',
                        style: TextStyle(
                          color: Color(0xad20167a),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xff3c4858),
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'By '),
                      TextSpan(
                        text: widget.newsData.author,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ', ${widget.newsData.modifiedDate}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
