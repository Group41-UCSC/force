import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class LabelField extends StatelessWidget {
  final String labelText;
  final String value;
  final int maxLines;

  const LabelField({
    Key? key,
    required this.labelText,
    required this.value,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blueGrey[50],
        child: TextFormField(
          autofocus: false,
          initialValue: value,
          readOnly: true,
          maxLines: maxLines,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a ${labelText.toLowerCase()}';
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey[50] ?? Colors.blueGrey,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            fillColor: Colors.blueGrey[50],
            labelText: labelText,
            alignLabelWithHint: true,
            hintStyle: TextStyle(color: CustomColor.primary),
          ),
        ),
      ),
    );
  }
}
