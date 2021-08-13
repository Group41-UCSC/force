import 'package:flutter/material.dart';

class DropdownFilter extends StatefulWidget {
  final String title;
  final List<dynamic> filters;
  final TextEditingController controller;
  final VoidCallback? callback;

  DropdownFilter({
    Key? key,
    required this.title,
    required this.filters,
    required this.controller,
    this.callback,
  }) : super(key: key);

  @override
  _DropdownFilterState createState() => _DropdownFilterState();
}

class _DropdownFilterState extends State<DropdownFilter> {
  late String currentValue;

  @override
  void initState() {
    setState(() {
      currentValue = widget.filters.first;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<dynamic>(
          hint: Text(widget.title),
          value: currentValue,
          iconSize: 24,
          elevation: 16,
          onChanged: (dynamic? newValue) {
            setState(() {
              currentValue = newValue!;
              widget.controller.text = currentValue;
            });
            widget.callback!();
          },
          items: widget.filters.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(fontSize: 14),),
            );
          }).toList(),
        ),
      ),
    );
  }
}
