import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/nav_menu_items.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var footerList = <Widget>[];

    for (var item in navMenuItems) {
      footerList.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, item.routeName);
            },
            child: Text(
              item.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey[900]),
      child: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            decoration: BoxDecoration(color: Colors.blueGrey[900]),
            child: Row(
              children: [
                ...footerList,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: Text('© 2007-2021 RoyalScouts',
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
