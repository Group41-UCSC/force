import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class OriginRadioField extends StatefulWidget {
  final TextEditingController controller;
  final bool editMode;

  const OriginRadioField({
    Key? key,
    required this.controller,
    this.editMode = false,
  }) : super(key: key);

  @override
  _OriginRadioFieldState createState() => _OriginRadioFieldState();
}

class _OriginRadioFieldState extends State<OriginRadioField> {
  // Group Value for Radio Button.
  late int id;

  @override
  void initState() {
    setState(() {
      if (!widget.editMode) {
        id = 1;
        widget.controller.text = "new";
      } else {
        if (widget.controller.text == "new")
          id = 1;
        else
          id = 2;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: <Widget>[
              Container(
                width: 100.0,
                child: Text(
                  "Origin",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: CustomColor.primary),
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey[50],
                child: Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      id = 1;
                      widget.controller.text = "new";
                    });
                  },
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              Container(
                width: 80.0,
                child: Text(
                  "New Programme",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey[50],
                child: Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      id = 2;
                      widget.controller.text = "old";
                    });
                  },
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              Container(
                width: 80.0,
                child: Text(
                  "Old Programme",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
