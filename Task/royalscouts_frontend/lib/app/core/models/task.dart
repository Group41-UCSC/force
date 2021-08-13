class Task {
  final num id;
  final String title;
  final String status;
  final String origin;
  final String opc;
  final String npc;
  final String description;
  final String programmeType;
  final String spice;
  final int durationDays;
  final int durationHours;
  final int durationMins;
  final String participation;
  final String location;
  final int bonus;
  final int score;
  final String supervision;
  final String difficulty;
  final String createdBy;
  final String approvedBy;
  final String thingsNeeded;

  Task({
    required this.id,
    required this.title,
    required this.status,
    required this.origin,
    required this.opc,
    required this.npc,
    required this.description,
    required this.programmeType,
    required this.spice,
    required this.durationDays,
    required this.durationHours,
    required this.durationMins,
    required this.participation,
    required this.location,
    required this.bonus,
    required this.score,
    required this.supervision,
    required this.difficulty,
    required this.createdBy,
    required this.approvedBy,
    required this.thingsNeeded,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      origin: json['origin'],
      opc: json['opc'],
      npc: json['npc'],
      description: json['description'],
      programmeType: json['programmeType'],
      spice: json['spice'],
      durationDays: json['durationDays'],
      durationHours: json['durationHours'],
      durationMins: json['durationMins'],
      participation: json['participation'],
      location: json['location'],
      bonus: json['bonus'],
      score: json['score'],
      supervision: json['supervision'],
      difficulty: json['difficulty'],
      createdBy: json['createdBy'],
      approvedBy: json['approvedBy'] ?? '',
      thingsNeeded: json['thingsNeeded'] ?? '',
    );
  }

  Map<String, dynamic> get values {
    return {
      'id': id,
      'title': title,
      'status': status,
      'origin': origin,
      'opc': opc,
      'npc': npc,
      'description': description,
      'programmeType': programmeType,
      'spice': spice,
      'durationDays': durationDays,
      'durationHours': durationHours,
      'durationMins': durationMins,
      'participation': participation,
      'location': location,
      'bonus': bonus,
      'score': score,
      'supervision': supervision,
      'difficulty': difficulty,
      'createdBy': createdBy,
      'approvedBy': approvedBy,
      'thingsNeeded': thingsNeeded,
    };
  }

  static Task setEmptyTask() {
    return Task(
      id: 0,
      title: '',
      origin: '',
      opc: '',
      npc: '',
      status: '',
      description: '',
      programmeType: '',
      spice: '',
      durationDays: 0,
      durationHours: 0,
      durationMins: 0,
      participation: '',
      location: '',
      bonus: 0,
      score: 0,
      supervision: '',
      difficulty: '',
      createdBy: '',
      approvedBy: '',
      thingsNeeded: '',
    );
  }
}
