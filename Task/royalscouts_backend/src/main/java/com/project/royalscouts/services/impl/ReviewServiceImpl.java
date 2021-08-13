package com.project.royalscouts.services.impl;

import java.util.List;
import java.util.Optional;

import com.project.royalscouts.dtos.ReviewRequest;
import com.project.royalscouts.exceptions.ResourceNotFoundException;
import com.project.royalscouts.models.Review;
import com.project.royalscouts.repositories.ReviewRepository;
import com.project.royalscouts.repositories.TaskRepository;
import com.project.royalscouts.services.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

  @Autowired
  TaskRepository taskRepository;

  @Autowired
  private ReviewRepository reviewRepository;

  @Override
  public List<Review> getReviews(Long taskId) {
    return reviewRepository.findByTaskId(taskId);
  }

  @Override
  public Review addReview(ReviewRequest reviewRequest) {
    Review newReview = new Review();
    newReview.setComments(reviewRequest.getComments());
    newReview.setFrequency(reviewRequest.getFrequency());
    newReview.setReviewedBy(reviewRequest.getReviewedBy());
    newReview.setPermissionAction(reviewRequest.getPermissionAction());
    return taskRepository.findById(reviewRequest.getTaskId()).map(task -> {
      newReview.setTask(task);
      return reviewRepository.save(newReview);
    }).orElseThrow(() -> new ResourceNotFoundException());
  }

  @Override
  public void updateReview(Long reviewId, ReviewRequest reviewRequest) {
    Optional<Review> reviewFromDb = reviewRepository.findById(reviewId);
    if (reviewFromDb.isPresent()) {
      reviewFromDb.get().setComments(reviewRequest.getComments());
      reviewFromDb.get().setFrequency(reviewRequest.getFrequency());
      reviewFromDb.get().setReviewedBy(reviewRequest.getReviewedBy());
      reviewFromDb.get().setPermissionAction(reviewRequest.getPermissionAction());
      reviewRepository.save(reviewFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }

  @Override
  public void deleteReview(Long reviewId) {
    Optional<Review> reviewFromDb = reviewRepository.findById(reviewId);
    if (reviewFromDb.isPresent()) {
      reviewRepository.delete(reviewFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }
}
