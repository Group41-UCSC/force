import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavLink extends StatefulWidget {
  final VoidCallback? onClick;

  final String text;
  final double? lineHeight;
  final Color defaultColor;
  final Color onHoverColor;
  final double fontSize;
  final String? fontFamily;
  final FontWeight fontWeight;

  const NavLink(
      {Key? key,
      required this.text,
      this.lineHeight,
      required this.defaultColor,
      required this.onHoverColor,
      required this.fontSize,
      this.fontFamily,
      required this.fontWeight,
      this.onClick})
      : super(key: key);

  @override
  _NavLinkState createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool linkHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => {
          setState(() {
            linkHover = true;
          })
        },
        onExit: (event) => {
          setState(() {
            linkHover = false;
          })
        },
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            height: widget.lineHeight,
            color: linkHover ? widget.onHoverColor : widget.defaultColor,
            fontFamily: widget.fontFamily ?? 'Roboto',
            fontWeight: widget.fontWeight,
          ),
        ),
      ),
    );
  }
}
