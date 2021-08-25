import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_folder/pages/form/widget/button_widget.dart';
import 'package:inventory_folder/pages/widgets/scrollable_widget.dart';
import 'package:inventory_folder/responsive_layout.dart';
import 'package:inventory_folder/pages/widgets/app_bar_widget.dart';
import 'package:inventory_folder/pages/table_reserved/table_reserved_page.dart';
import 'package:inventory_folder/pages/drawer/drawer_page.dart';
import 'package:inventory_folder/constants.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormScreenState();
  }
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  String itemID = '';
  String itemName = '';
  String source = '';
  String inventoryID = '';
  String storageID = '';
  String quantity = '';
  String lifespan = '';
  String price = '';
  String builds = '';
  String status = '';
  String description = '';

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
                label: Text('ADD A NEW ITEM',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              buildItemID(),
              const SizedBox(height: 16),
              buildItemName(),
              const SizedBox(height: 16),
              buildSource(),
              const SizedBox(height: 16),
              buildInventoryID(),
              const SizedBox(height: 16),
              buildStorageID(),
              const SizedBox(height: 16),
              buildQuantity(),
              const SizedBox(height: 16),
              buildLifeSpan(),
              const SizedBox(height: 16),
              buildPrice(),
              const SizedBox(height: 16),
              buildBuilds(),
              const SizedBox(height: 16),
              buildStatus(),
              const SizedBox(height: 16),
              buildDescription(),
              const SizedBox(height: 16),
              buildSubmit(),
            ],
          ),
        ),
      );

  Widget buildItemID() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Item Id',
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
        onSaved: (value) => setState(() => itemID = value!),
      );
  Widget buildItemName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Item Name',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Item Name is required';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => itemName = value!),
      );

  Widget buildSource() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Source',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter an Source';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => source = value!),
      );

  Widget buildInventoryID() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Inventory ID',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Inventory ID Required';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => inventoryID = value!),
      );
  Widget buildStorageID() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Storage ID',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Storage ID is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => storageID = value!),
      );
  Widget buildQuantity() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Quantity',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Quantity is required';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => quantity = value!),
      );
  Widget buildLifeSpan() => TextFormField(
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
      );
}
