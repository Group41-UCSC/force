import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:force/app/modules/oldscouts/data/old-scout-data.dart';

class OldScoutNewsList extends StatefulWidget {
  OldScoutNewsList({Key? key}) : super(key: key);

  @override
  _OldScoutNewsListState createState() => _OldScoutNewsListState();
}

class _OldScoutNewsListState extends State<OldScoutNewsList> {
  @override
  Widget build(BuildContext context) {
    return BootstrapRow(
        children: List.generate(
            oldScoutList.length,
            (index) => BootstrapCol(
                sizes: 'col-sm-4',
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Image.asset(oldScoutList[index].imageUrl),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(oldScoutList[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ))));
  }
}
