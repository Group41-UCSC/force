import 'package:flutter/material.dart';

class Banner01 extends StatelessWidget {
  final String title;

  const Banner01({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 5,
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
