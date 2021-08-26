class Review {
  final num id;
  final String comments;
  final String reviewedBy;
  final String permissionAction;
  final String frequency;
  final String createdAt;

  Review({
    required this.id,
    required this.comments,
    required this.reviewedBy,
    required this.permissionAction,
    required this.frequency,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      comments: json['comments'],
      reviewedBy: json['reviewedBy'],
      permissionAction: json['permissionAction'],
      frequency: json['frequency'],
      createdAt: json['createdAt']
    );
  }
}
