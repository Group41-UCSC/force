import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:force/app/modules/oldscouts/widgets/oldscoutnews/old-scout-news-list.dart';

class OldScoutNews extends StatefulWidget {
  OldScoutNews({Key? key}) : super(key: key);

  @override
  _OldScoutNewsState createState() => _OldScoutNewsState();
}

class _OldScoutNewsState extends State<OldScoutNews> {
  @override
  Widget build(BuildContext context) {
    return BootstrapCol(
        sizes: 'col-md-6',
        child: Column(children: [
          Container(
            child: Text('Old Scouts\' News',
                style: TextStyle(
                    fontSize: 29.2,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(60, 72, 88, 1))),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
                'We will endeavour to keep you updated here with the\nlatest News related to Royal College Old Scouts\nAssociation (RCOSA).',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20)),
          ),
          OldScoutNewsList()
        ]));
  }
}
