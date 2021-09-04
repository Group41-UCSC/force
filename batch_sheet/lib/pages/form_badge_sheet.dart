import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:batch_sheet/widget/button_widget.dart';
import 'package:batch_sheet/widget/scrollable_widget.dart';
import 'package:batch_sheet/widget/responsive_layout.dart';
import 'package:batch_sheet/widget/app_bar_widget.dart';
import 'package:batch_sheet/constants.dart';

class FormBadgeSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormBadgeSheetState();
  }
}

class _FormBadgeSheetState extends State<FormBadgeSheet> {
  final formKey = GlobalKey<FormState>();

  String bookID = '';
  String bookType = '';
  String serialNumStart = '';
  String serialNumEnd = '';
  String total = '';
  String issuedCount = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: (ResponsiveLayout.isTinyLimit(context) ||
                  ResponsiveLayout.isTinyHeightLimit(context) ||
                  ResponsiveLayout.isPhone(context))
              ? Container()
              : AppBarWidget(),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                  size: 30,
                ),
                label: Text('ADD NEW BADGE SHEETS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              buildBookID(),
              const SizedBox(height: 16),
              buildBookType(),
              const SizedBox(height: 16),
              buildSerialNumStart(),
              const SizedBox(height: 16),
              buildSerialNumEnd(),
              const SizedBox(height: 16),
              buildTotal(),
              const SizedBox(height: 16),
              buildIssuedCount(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildBookID() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Book ID',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Item ID is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => bookID = value!),
      );
  Widget buildBookType() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Book Type',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Book Type is required';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => bookType = value!),
      );

  Widget buildSerialNumStart() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Serial Number Start',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter the Serial Number Start';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => serialNumStart = value!),
      );

  Widget buildSerialNumEnd() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Serial Number End',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Serial number End is Required';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => serialNumEnd = value!),
      );
  Widget buildTotal() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Total',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Total is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => total = value!),
      );
  Widget buildIssuedCount() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Issued Count',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Issued count is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => issuedCount = value!),
      );
  /*Widget buildLifeSpan() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Life Span',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Life span is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => lifespan = value!),
      );
  Widget buildPrice() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Price',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Price is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => price = value!),
      );
  Widget buildBuilds() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Builds',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Builds is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => builds = value!),
      );
  Widget buildStatus() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Status',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Status is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => status = value!),
      );
  Widget buildDescription() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Description',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Description is required';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => description = value!),
      );
  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();

              final message =
                  'itemID: $itemID\nitemName: $itemName\nsource: $source\ninventoryID: $inventoryID\nstorageID: $storageID\nquantity: $quantity\nlifeSpan: $lifespan\nprice: $price\nbuilds: $builds\nstatus: $status\ndescription: $description';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 18),
                ),
                backgroundColor: Colors.grey,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );*/
}
