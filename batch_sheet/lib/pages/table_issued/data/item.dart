class Item {
  final String bookID;
  final String serialNum;
  final String issuedDate;
  final String issuedTo;
  final String supervisor;

  Item({
    required this.bookID,
    required this.serialNum,
    required this.issuedDate,
    required this.issuedTo,
    required this.supervisor,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
        bookID: '5',
        serialNum: 'S051',
        issuedDate: '25.02.2021',
        issuedTo: 'Nimal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '5',
        serialNum: 'S033',
        issuedDate: '07.04.2021',
        issuedTo: 'Anil',
        supervisor: 'Ram',
      ),
      Item(
        bookID: '5',
        serialNum: 'S011',
        issuedDate: '11.03.2021',
        issuedTo: 'Ane',
        supervisor: 'bob',
      ),
      Item(
        bookID: '5',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '5',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '2',
        serialNum: 'S077',
        issuedDate: '25.07.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '4',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '5',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '5',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '5',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '5',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
      ),
      Item(
        bookID: '5',
        serialNum: 'S029',
        issuedDate: '25.17.2021',
        issuedTo: 'Amal',
        supervisor: 'Juzly',
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
