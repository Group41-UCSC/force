import 'dart:convert';

import 'package:http/http.dart';
import 'package:royalscouts/app/core/models/review.dart';

class ReviewService {
  final String apiUrl = "http://localhost:8080/api/v1/reviews";

  Future<List<Review>> getReviewsByTaskId(num id) async {
    final response = await get(Uri.parse('$apiUrl?taskId=$id'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Review> data =
          body.map((dynamic item) => Review.fromJson(item)).toList();
      return data;
    } else {
      throw "Failed to load review list";
    }
  }

  Future<Review> addReview(Map reviewData) async {
    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(reviewData),
    );
    if (response.statusCode == 201) {
      return Review.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post a review');
    }
  }

  Future<Review> updateReview(num id, Map reviewData) async {
    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(reviewData),
    );
    if (response.statusCode == 200) {
      return Review.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a review');
    }
  }

  Future<void> deleteReview(num id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Review deleted");
    } else {
      throw "Failed to delete a review.";
    }
  }
}
