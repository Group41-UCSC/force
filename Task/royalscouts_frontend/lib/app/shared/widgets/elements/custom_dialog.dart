import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final Widget child;

  const CustomDialog({Key? key, required this.child}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: 500,
    padding: const EdgeInsets.only(top: 20.0),
      margin: EdgeInsets.symmetric(horizontal: 100),
      child: ListView(
        children: [widget.child],
      ),
    );
  }
}
