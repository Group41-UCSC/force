class Item {
  final String itemName;
  final String quantity;
  final String requestedBy;
  final String requestedDate;
  final String event;

  const Item({
    required this.itemName,
    required this.quantity,
    required this.requestedBy,
    required this.requestedDate,
    required this.event,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
          itemName: 'Rope',
          quantity: '6',
          requestedBy: "s",
          requestedDate: "9",
          event: "a"),
      Item(
          itemName: 'Rope',
          quantity: '10',
          requestedBy: "j",
          requestedDate: "3",
          event: "o"),
      Item(
          itemName: 'Rope',
          quantity: '3',
          requestedBy: "s",
          requestedDate: "3",
          event: "a"),
      Item(
          itemName: 'Axe',
          quantity: '6',
          requestedBy: "k",
          requestedDate: "7",
          event: "l"),
      Item(
          itemName: 'Rope',
          quantity: '8',
          requestedBy: "y",
          requestedDate: "4",
          event: "c"),
      Item(
          itemName: 'Rope',
          quantity: '3',
          requestedBy: "d",
          requestedDate: "8",
          event: "j"),
      Item(
          itemName: 'Rope',
          quantity: '10',
          requestedBy: "s",
          requestedDate: "a",
          event: "a"),
      Item(
          itemName: 'Rope',
          quantity: '10',
          requestedBy: "s",
          requestedDate: "a",
          event: "a"),
      Item(
          itemName: 'Rope',
          quantity: '10',
          requestedBy: "s",
          requestedDate: "a",
          event: "a"),
      Item(
          itemName: 'Rope',
          quantity: '10',
          requestedBy: "s",
          requestedDate: "a",
          event: "a"),
      Item(
          itemName: 'Rope',
          quantity: '10',
          requestedBy: "s",
          requestedDate: "a",
          event: "a"),
      Item(
          itemName: 'Rope',
          quantity: '10',
          requestedBy: "s",
          requestedDate: "a",
          event: "a"),
    ];
  }
}
