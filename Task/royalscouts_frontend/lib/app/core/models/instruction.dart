class Instruction {
  final num id;
  final String content;

  Instruction({required this.id, required this.content});

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      id: json['id'],
      content: json['content'],
    );
  }
}
