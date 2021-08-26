import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class NumberInputField extends StatefulWidget {
  final String label;
  final String content;
  final bool disable;
  final TextEditingController controller;

  NumberInputField({
    required this.label,
    required this.content,
    required this.controller,
    this.disable = false,
  });

  @override
  _NumberInputFieldState createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  bool isEmpty = false;

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
                    readOnly: widget.disable,
                    controller: widget.controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    maxLines: 1,
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
