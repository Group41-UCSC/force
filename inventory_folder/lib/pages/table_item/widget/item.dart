class Item {
  final String itemID;
  final String itemName;
  final String source;
  final String inventoryID;
  final String storageID;
  final String quantity;
  final String lifespan;
  final String price;
  final String build;
  final String status;
  final String description;

  const Item({
    required this.itemID,
    required this.itemName,
    required this.source,
    required this.inventoryID,
    required this.storageID,
    required this.quantity,
    required this.lifespan,
    required this.price,
    required this.build,
    required this.status,
    required this.description,
  });

  static List<Item> getItems() {
    return <Item>[
      Item(
          itemID: '9',
          itemName: 'Map',
          source: "b",
          inventoryID: '5',
          storageID: '6',
          quantity: '10',
          lifespan: "j",
          price: '60',
          build: "v",
          status: "Good",
          description: "e"),
      Item(
          itemID: '7',
          itemName: 'Axe',
          source: "k",
          inventoryID: '5',
          storageID: '9',
          quantity: '1',
          lifespan: "l",
          price: '88',
          build: "p",
          status: "f",
          description: "p"),
      Item(
          itemID: '1',
          itemName: 'Rope',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
      Item(
          itemID: '1',
          itemName: 'Rope',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
      Item(
          itemID: '1',
          itemName: 'Rope',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
      Item(
          itemID: '4',
          itemName: 'Cooker',
          source: "e",
          inventoryID: '7',
          storageID: '3',
          quantity: '1',
          lifespan: "g",
          price: '1200',
          build: "i",
          status: "r",
          description: "h"),
      Item(
        itemID: '1',
        itemName: 'Rope',
        source: "a",
        inventoryID: '2',
        storageID: '5',
        quantity: '6',
        lifespan: "a",
        price: '6',
        build: "s",
        status: "a",
        description: "a",
      ),
      Item(
          itemID: '1',
          itemName: 'Rope',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
      Item(
          itemID: '1',
          itemName: 'Rope',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
      Item(
          itemID: '1',
          itemName: 'Hammer',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
      Item(
          itemID: '1',
          itemName: 'Rope',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
      Item(
          itemID: '1',
          itemName: 'Rope',
          source: "a",
          inventoryID: '2',
          storageID: '5',
          quantity: '6',
          lifespan: "a",
          price: '6',
          build: "s",
          status: "a",
          description: "a"),
    ];
  }
}
