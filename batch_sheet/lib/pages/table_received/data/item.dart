class Item {
  final String bookID;
  final String serialNum;
  final String receivedDate;

  Item({
    required this.bookID,
    required this.serialNum,
    required this.receivedDate,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '2',
        serialNum: 'S022',
        receivedDate: '14',
      ),
      Item(
        bookID: '3',
        serialNum: 'S004',
        receivedDate: '06',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '5',
        serialNum: 'S049',
        receivedDate: '25',
      ),
      Item(
        bookID: '1',
        serialNum: 'S033',
        receivedDate: '12',
      ),
    ];
  }
}
