import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class DropdownField extends StatefulWidget {
  final String label;
  final List<dynamic> contents;
  final TextEditingController controller;
  final bool editMode;
  final bool disable;

  DropdownField({
    Key? key,
    required this.label,
    required this.contents,
    required this.controller,
    this.editMode = false,
    this.disable = false,
  }) : super(key: key);

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  late String currentValue;

  @override
  void initState() {
    if (!widget.editMode) {
      setState(() {
        currentValue = widget.contents.first;
      });
      widget.controller.text = widget.contents.first;
    } else {
      setState(() {
        currentValue = widget.controller.text;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disable,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              children: <Widget>[
                Container(
                  width: 90.0,
                  child: Text(
                    "${widget.label}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: CustomColor.primary),
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Expanded(
                  child: Container(
                    color: Colors.blueGrey[50],
                    child: DropdownButtonFormField<dynamic>(
                      value: currentValue,
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (dynamic? newValue) {
                        setState(() {
                          currentValue = newValue!;
                          widget.controller.text = currentValue;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey[50] ?? Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey[50] ?? Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fillColor: Colors.blueGrey[50],
                        filled: true,
                      ),
                      items: widget.contents
                          .map<DropdownMenuItem<dynamic>>((dynamic value) {
                        return DropdownMenuItem<dynamic>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
