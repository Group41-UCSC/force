import 'dart:convert';

import 'package:http/http.dart';
import 'package:royalscouts/app/core/models/instruction.dart';

class InstructionService {
  final String apiUrl = "http://localhost:8080/api/v1/instructions";

  Future<List<Instruction>> getInstructionsByTaskId(num id) async {
    final response = await get(Uri.parse('$apiUrl?taskId=$id'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Instruction> data =
          body.map((dynamic item) => Instruction.fromJson(item)).toList();
      return data;
    } else {
      throw "Failed to load instruction list";
    }
  }
}
