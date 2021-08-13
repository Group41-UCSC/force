import 'dart:convert';

import 'package:http/http.dart';
import 'package:royalscouts/app/core/models/task.dart';

class TaskService {
  final String apiUrl = "http://localhost:8080/api/v1/tasks";

  Future<List<Task>> getTasks() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Task> data =
          body.map((dynamic item) => Task.fromJson(item)).toList();
      return data;
    } else {
      throw "Failed to load task list";
    }
  }

  Future<Task> getTaskById(num id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Task> addTask(Map taskData) async {
    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(taskData),
    );
    if (response.statusCode == 201) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post a task');
    }
  }

  Future<Task> updateTask(num id, Map taskData) async {
    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(taskData),
    );
    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a task');
    }
  }

  Future<Task> updateStatus(num id, Map statusData) async {
    final Response response = await put(
      Uri.parse('$apiUrl/$id/status'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(statusData),
    );
    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteTask(num id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Task deleted");
    } else {
      print("Failed to delete a task.");
    }
  }
}
