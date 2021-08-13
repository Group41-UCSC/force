import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class RatingField extends StatefulWidget {
  final String label;
  final double initialValue;
  final double itemSize;
  final bool disable;

  final Function? setValue;

  RatingField({
    required this.label,
    this.initialValue = 3,
    this.setValue,
    this.itemSize=40,
    this.disable = false,
  });

  @override
  _RatingFieldState createState() => _RatingFieldState();
}

class _RatingFieldState extends State<RatingField> {
  num feedbackRating = 3;

  @override
  void initState() {
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
                width: 30.0,
              ),
              Expanded(
                child: RatingBar.builder(
                  initialRating: widget.initialValue,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemSize: widget.itemSize,
                  itemBuilder: (context, _) =>
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      widget.setValue!(rating.toString());
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
