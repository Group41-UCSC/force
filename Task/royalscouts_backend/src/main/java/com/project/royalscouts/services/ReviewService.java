package com.project.royalscouts.services;

import java.util.List;

import com.project.royalscouts.dtos.ReviewRequest;
import com.project.royalscouts.models.Review;

public interface ReviewService {

  List<Review> getReviews(Long taskId);

  Review addReview(ReviewRequest reviewRequest);

  void updateReview(Long reviewId, ReviewRequest reviewRequest);

  void deleteReview(Long reviewId);

}
