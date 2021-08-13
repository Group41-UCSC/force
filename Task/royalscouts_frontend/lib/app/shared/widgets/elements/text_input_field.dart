import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class TextInputField extends StatefulWidget {
  final String label;
  final String content;
  final int maxLines;
  final bool disable;

  final TextEditingController controller;

  TextInputField({
    required this.label,
    required this.controller,
    this.content = "",
    this.maxLines = 1,
    this.disable = false,
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool isEmpty = false;

  @override
  void initState() {
    if (widget.disable) {
      widget.controller.text = widget.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  color: isEmpty ? Colors.white : Colors.blue[50],
                  child: TextFormField(
                    controller: widget.controller,
                    readOnly: widget.disable,
                    validator: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          isEmpty = true;
                        });
                        return 'Please enter a ${widget.label.toLowerCase()}';
                      }
                    },
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    maxLines: widget.maxLines,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[50] ?? Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[50] ?? Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "${widget.content}",
                      fillColor: Colors.blue[50],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
