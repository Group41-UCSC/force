import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

final ButtonStyle redButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.red,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.all(16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: CustomColor.primary,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.all(16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);


final ButtonStyle blackButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.black,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.all(16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

