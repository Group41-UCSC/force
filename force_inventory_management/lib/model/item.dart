class Item {
  final int storageID;
  final int itemID;
  final String itemName;
  final int quantity;

  const Item({
    required this.storageID,
    required this.itemID,
    required this.itemName,
    required this.quantity,
  });

  Item copy({
    int? storageID,
    int? itemID,
    String? itemName,
    int? quantity,
  }) =>
      Item(
        storageID: storageID ?? this.storageID,
        itemID: itemID ?? this.itemID,
        itemName: itemName ?? this.itemName,
        quantity: quantity ?? this.quantity,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          storageID == other.storageID &&
          itemID == other.itemID &&
          itemName == other.itemName &&
          quantity == other.quantity;

  @override
  int get hashCode =>
      storageID.hashCode ^
      itemID.hashCode ^
      itemName.hashCode ^
      quantity.hashCode;
}
