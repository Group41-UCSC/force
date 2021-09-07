import 'dart:convert';

import 'package:http/http.dart';
import 'package:royalscouts/app/core/models/evaluation.dart';
import 'package:royalscouts/app/core/models/evaluation.dart';

class EvaluationService {
  final String apiUrl = "http://localhost:8080/api/v1/evaluations";

  Future<List<Evaluation>> getEvaluations() async {
    final response = await get(Uri.parse('$apiUrl'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Evaluation> data =
          body.map((dynamic item) => Evaluation.fromJson(item)).toList();
      return data;
    } else {
      throw "Failed to load evaluation list";
    }
  }

  Future<Evaluation> addEvaluation(Map evaluationData) async {
    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(evaluationData),
    );
    if (response.statusCode == 201) {
      return Evaluation.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post a evaluation');
    }
  }

  Future<Evaluation> updateEvaluation(num id, Map evaluationData) async {
    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(evaluationData),
    );
    if (response.statusCode == 200) {
      return Evaluation.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a evaluation');
    }
  }

  Future<void> deleteEvaluation(num id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Evaluation deleted");
    } else {
      throw "Failed to delete a evaluation.";
    }
  }
}
