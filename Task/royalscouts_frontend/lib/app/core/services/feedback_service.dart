import 'dart:convert';

import 'package:http/http.dart';
import 'package:royalscouts/app/core/models/feedback.dart';

class FeedbackService {
  final String apiUrl = "http://localhost:8080/api/v1/feedbacks";

  Future<List<TaskFeedback>> getFeedbacksByTaskId(num id) async {
    final response = await get(Uri.parse('$apiUrl?taskId=$id'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<TaskFeedback> data =
          body.map((dynamic item) => TaskFeedback.fromJson(item)).toList();
      return data;
    } else {
      throw "Failed to load feedbak list";
    }
  }

  Future<TaskFeedback> addFeedback(Map reviewData) async {
    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(reviewData),
    );
    if (response.statusCode == 201) {
      return TaskFeedback.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post a feedback');
    }
  }

  Future<void> updateFeedbackVisibility(num id, bool isChecked) async {
    final Response response = await put(
      Uri.parse('$apiUrl/$id/visibility?isChecked=$isChecked'),
    );
    if (response.statusCode == 200) {
      print("feedback visibility updated");
    } else {
      throw Exception('Failed to update a feedback');
    }
  }

  Future<void> deleteFeedback(num id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("feedback deleted");
    } else {
      throw "Failed to delete a feedback.";
    }
  }
}
