import 'package:flutter/cupertino.dart';

class Item {
  final String itemID;
  final String itemName;
  final String event;
  final String requestedBy;
  final String requestedDate;
  final String quantity;
  final String status;

  const Item({
    required this.itemID,
    required this.itemName,
    required this.event,
    required this.requestedBy,
    required this.requestedDate,
    required this.quantity,
    required this.status,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "n",
        requestedBy: "juzly",
        requestedDate: '22',
        quantity: '2',
        status: "c",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
      Item(
        itemID: '5',
        itemName: 'Rope',
        event: "f",
        requestedBy: "juzly",
        requestedDate: '6',
        quantity: '3',
        status: "o",
      ),
      Item(
        itemID: '8',
        itemName: 'Hammer',
        event: "p",
        requestedBy: "juzly",
        requestedDate: '4',
        quantity: '9',
        status: "i",
      ),
      Item(
        itemID: '3',
        itemName: 'Axe',
        event: "j",
        requestedBy: "juzly",
        requestedDate: '7',
        quantity: '2',
        status: "h",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        event: "a",
        requestedBy: "juzly",
        requestedDate: '10',
        quantity: '5',
        status: "a",
      ),
    ];
  }
}
