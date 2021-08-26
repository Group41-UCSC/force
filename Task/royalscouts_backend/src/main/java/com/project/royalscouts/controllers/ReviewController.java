package com.project.royalscouts.controllers;

import java.util.List;

import com.project.royalscouts.dtos.ReviewRequest;
import com.project.royalscouts.models.Review;
import com.project.royalscouts.services.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/reviews")
@CrossOrigin("*")
public class ReviewController {
  @Autowired
  ReviewService reviewService;

  @GetMapping
  public ResponseEntity<List<Review>> getAllReviewsByTaskId(@RequestParam Long taskId) {
    return new ResponseEntity<>(reviewService.getReviews(taskId), HttpStatus.OK);
  }

  @PostMapping
  public ResponseEntity<Review> createReview(@RequestBody ReviewRequest reviewRequest) {
    return new ResponseEntity<>(reviewService.addReview(reviewRequest), HttpStatus.CREATED);
  }

  @PutMapping("{reviewId}")
  public ResponseEntity<Void> updateTask(@PathVariable("reviewId") Long reviewId,
      @RequestBody ReviewRequest reviewRequest) {
    reviewService.updateReview(reviewId, reviewRequest);
    return new ResponseEntity<>(HttpStatus.OK);
  }

  @DeleteMapping("{reviewId}")
  public ResponseEntity<Void> deleteTask(@PathVariable("reviewId") Long reviewId) {
    reviewService.deleteReview(reviewId);
    return new ResponseEntity<>(HttpStatus.NO_CONTENT);
  }

}
