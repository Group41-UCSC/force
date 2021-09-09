class Evaluation {
  final num id;
  final num taskId;
  final String title;
  final String startDate;
  final String endDate;
  final num version;
  final String createdBy;

  Evaluation({
    required this.id,
    required this.taskId,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.version,
    required this.createdBy,
  });

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      id: json['id'],
      taskId: json['taskId'],
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      version: json['version'],
      createdBy: json['createdBy'],
    );
  }
}
