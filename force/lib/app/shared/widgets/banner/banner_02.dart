import 'package:flutter/material.dart';

class Banner02 extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? child;

  const Banner02({
    Key? key,
    required this.title,
    this.subTitle,
    this.child,
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
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: Text(
                    subTitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 90.0),
                  child: child!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
