class Request {
  final String itemName;
  final int itemID;
  final String userName;
  final int quantity;
  final String status;

  const Request({
    required this.itemName,
    required this.itemID,
    required this.userName,
    required this.quantity,
    required this.status,
  });

  Request copy({
    String? itemName,
    int? itemID,
    String? userName,
    int? quantity,
    String? status,
  }) =>
      Request(
        itemName: itemName ?? this.itemName,
        itemID: itemID ?? this.itemID,
        userName: userName ?? this.userName,
        quantity: quantity ?? this.quantity,
        status: status ?? this.status,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Request &&
          runtimeType == other.runtimeType &&
          itemName == other.itemName &&
          itemID == other.itemID &&
          userName == other.userName &&
          quantity == other.quantity &&
          status == other.status;

  @override
  int get hashCode =>
      itemName.hashCode ^
      itemID.hashCode ^
      userName.hashCode ^
      quantity.hashCode ^
      status.hashCode;
}
