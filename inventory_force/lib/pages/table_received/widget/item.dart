class Item {
  final String itemID;
  final String itemName;
  final String receivedBy;
  final String reviewItem;
  final String condition;

  const Item({
    required this.itemID,
    required this.itemName,
    required this.receivedBy,
    required this.reviewItem,
    required this.condition,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "a",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "a",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '5',
        itemName: 'Hammer',
        receivedBy: "a",
        reviewItem: "Bad",
        condition: "No Damages",
      ),
      Item(
        itemID: '1',
        itemName: 'Axe',
        receivedBy: "g",
        reviewItem: "Bad",
        condition: "Damaged",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "a",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '3',
        itemName: 'Rope',
        receivedBy: "l",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "a",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '7',
        itemName: 'Rope',
        receivedBy: "a",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "a",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "j",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "c",
        reviewItem: "good",
        condition: "No Damages",
      ),
      Item(
        itemID: '1',
        itemName: 'Rope',
        receivedBy: "a",
        reviewItem: "good",
        condition: "No Damages",
      ),
    ];
  }
}
