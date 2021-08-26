import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class DurationField extends StatefulWidget {
  final TextEditingController dayController;
  final TextEditingController hourController;
  final TextEditingController minController;

  DurationField({
    Key? key,
    required this.dayController,
    required this.hourController,
    required this.minController,
  }) : super(key: key);

  @override
  _DurationFieldState createState() => _DurationFieldState();
}

class _DurationFieldState extends State<DurationField> {
  bool isDayEmpty = false;
  bool isHourEmpty = false;
  bool isMinEmpty = false;

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
                  "Duration",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: CustomColor.primary),
                ),
              ),
              SizedBox(
                width: 40.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Container(
                          color: isDayEmpty ? Colors.white : Colors.blue[50],
                          child: TextFormField(
                            controller: widget.dayController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  isDayEmpty = true;
                                });
                                return 'Enter days';
                              }
                            },
                            onSaved: (value) {
                              print("--------------------");
                              print(value);
                            },
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
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
                              hintText: "00 days",
                              fillColor: Colors.blue[50],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Container(
                          color: isHourEmpty ? Colors.white : Colors.blue[50],
                          child: TextFormField(
                            controller: widget.hourController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  isHourEmpty = true;
                                });
                                return 'Enter hours';
                              }
                            },
                            onSaved: (value) {
                              print("--------------------");
                              print(value);
                            },
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
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
                              hintText: "00 hours",
                              fillColor: Colors.blue[50],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 0.0,
                        ),
                        child: Container(
                          color: isMinEmpty ? Colors.white : Colors.blue[50],
                          child: TextFormField(
                            controller: widget.minController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  isMinEmpty = true;
                                });
                                return 'Enter minutes';
                              }
                            },
                            onSaved: (value) {
                              print("--------------------");
                              print(value);
                            },
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
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
                              hintText: "00 mins",
                              fillColor: Colors.blue[50],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
