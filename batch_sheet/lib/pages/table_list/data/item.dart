class Item {
  final String bookID;
  final String bookType;
  final String serialNumStart;
  final String serialNumEnd;
  final String total;
  final String issuedCount;

  Item({
    required this.bookID,
    required this.bookType,
    required this.serialNumStart,
    required this.serialNumEnd,
    required this.total,
    required this.issuedCount,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '3',
        bookType: 'Proficiency',
        serialNumStart: 'S122',
        serialNumEnd: 'S152',
        total: '30',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '5',
        bookType: 'Proficiency',
        serialNumStart: 'S001',
        serialNumEnd: 'S050',
        total: '49',
        issuedCount: '20',
      ),
      Item(
        bookID: '2',
        bookType: 'Proficiency',
        serialNumStart: 'S101',
        serialNumEnd: 'S121',
        total: '20',
        issuedCount: '20',
      ),
      Item(
        bookID: '8',
        bookType: 'Proficiency',
        serialNumStart: 'S0050',
        serialNumEnd: 'S100',
        total: '49',
        issuedCount: '20',
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
