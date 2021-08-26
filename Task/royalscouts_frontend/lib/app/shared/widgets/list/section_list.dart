import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:royalscouts/app/shared/widgets/nav_link.dart';

class SectionList extends StatefulWidget {
  final List<String> texts;
  final String title;

  SectionList(this.title, this.texts);

  @override
  _SectionListState createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    widgetList.add(
      Container(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff3c4858),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    widgetList.add(SizedBox(height: 15.0));

    for (var text in widget.texts) {
      widgetList.add(NavLink(
        text: text,
        defaultColor: Color(0xff23527c),
        lineHeight: 1.8,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        onHoverColor: Color(0xff20167a),
      ));

      widgetList.add(SizedBox(height: 10.0));
    }

    widgetList.add(SizedBox(height: 25.0));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }
}
