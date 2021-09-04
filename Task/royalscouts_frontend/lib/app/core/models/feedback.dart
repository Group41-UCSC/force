class TaskFeedback {
  final num id;
  final double rating;
  final String content;
  final String createdBy;
  late bool isChecked;

  TaskFeedback({
    required this.id,
    required this.rating,
    required this.content,
    required this.createdBy,
    this.isChecked = false,
  });

  factory TaskFeedback.fromJson(Map<String, dynamic> json) {
    print(json['isChecked']);
    return TaskFeedback(
      id: json['id'],
      rating: json['rating'],
      content: json['content'],
      createdBy: json['createdBy'],
      isChecked: json['checked'],
    );
  }
}
