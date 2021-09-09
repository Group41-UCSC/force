import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final double height;
  final Widget child;
  final bool enableCloseButton;
  final VoidCallback? onClosed;

  final bool enableEditButton;
  final VoidCallback? onEdit;

  const CustomCard({
    Key? key,
    required this.title,
    required this.height,
    required this.child,
    this.enableCloseButton = false,
    this.onClosed,
    this.enableEditButton = false,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 1.5,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                decoration: BoxDecoration(
                  color: CustomColor.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            if (enableEditButton)
              Positioned(
                top: 0,
                right: 25,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blueGrey,
                    size: 15,
                  ),
                  onPressed: onEdit,
                ),
              ),
            if (enableCloseButton)
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.blueGrey,
                    size: 15,
                  ),
                  onPressed: onClosed,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
