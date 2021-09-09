class Item {
  final String itemID;
  final String itemName;
  final String issuedDate;
  final String returnDate;
  final String requestedBy;

  Item({
    required this.itemID,
    required this.itemName,
    required this.issuedDate,
    required this.returnDate,
    required this.requestedBy,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
        itemID: '1',
        itemName: 'Rope',
        issuedDate: '25',
        returnDate: '41',
        requestedBy: 'Juzly',
      ),
      Item(
        itemID: '1',
        itemName: 'bag',
        issuedDate: '5',
        returnDate: '13',
        requestedBy: 'Amala',
      ),
      Item(
        itemID: '1',
        itemName: 'Hammer',
        issuedDate: '3',
        returnDate: '2',
        requestedBy: 'Nimal',
      ),
      Item(
        itemID: '1',
        itemName: 'Axe',
        issuedDate: '6',
        returnDate: '2',
        requestedBy: 'Mala',
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        issuedDate: '3',
        returnDate: '12',
        requestedBy: 'John',
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        issuedDate: '3',
        returnDate: '6',
        requestedBy: 'Roy',
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        issuedDate: '5',
        returnDate: '18',
        requestedBy: 'Alex',
      ),
      Item(
        itemID: '4',
        itemName: 'Rope',
        issuedDate: '19',
        returnDate: '22',
        requestedBy: 'Juzly',
      ),
      Item(
        itemID: '5',
        itemName: 'Rope',
        issuedDate: '29',
        returnDate: '21',
        requestedBy: 'Juzly',
      ),
      Item(
        itemID: '3',
        itemName: 'Rope',
        issuedDate: '24',
        returnDate: '3',
        requestedBy: 'Juzly',
      ),
      Item(
        itemID: '8',
        itemName: 'Rope',
        issuedDate: '5',
        returnDate: '15',
        requestedBy: 'Juzly',
      ),
      Item(
        itemID: '5',
        itemName: 'Rope',
        issuedDate: '14',
        returnDate: '5',
        requestedBy: 'Juzly',
      ),
    ];
  }
}
/*Item copy({
    int? itemID,
    String? itemName,
    int? issuedDate,
    int? returnDate,
    String? requestedBy,
  }) =>
      Item(
        itemID: itemID ?? this.itemID,
        itemName: itemName ?? this.itemName,
        issuedDate: issuedDate ?? this.issuedDate,
        returnDate: returnDate ?? this.returnDate,
        requestedBy: requestedBy ?? this.requestedBy,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          itemID == other.itemID &&
          itemName == other.itemName &&
          issuedDate == other.issuedDate &&
          returnDate == other.returnDate &&
          requestedBy == other.requestedBy;

  @override
  int get hashCode =>
      itemID.hashCode ^
      itemName.hashCode ^
      issuedDate.hashCode ^
      returnDate.hashCode ^
      requestedBy.hashCode;
}*/
