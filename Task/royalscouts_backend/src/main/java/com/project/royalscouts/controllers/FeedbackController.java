package com.project.royalscouts.controllers;

import java.util.List;

import com.project.royalscouts.dtos.FeedbackRequest;
import com.project.royalscouts.models.Feedback;
import com.project.royalscouts.services.FeedbackService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/feedbacks")
@CrossOrigin("*")
public class FeedbackController {
  @Autowired
  FeedbackService feedbackService;

  @GetMapping
  public ResponseEntity<List<Feedback>> getAllFeedbacksByTaskId(@RequestParam Long taskId) {
    return new ResponseEntity<>(feedbackService.getFeedbacks(taskId), HttpStatus.OK);
  }

  @PostMapping
  public ResponseEntity<Feedback> createFeedback(@RequestBody FeedbackRequest feedbackRequest) {
    return new ResponseEntity<>(feedbackService.addFeedback(feedbackRequest), HttpStatus.CREATED);
  }

  @PutMapping("{feedbackId}/visibility")
  public ResponseEntity<Void> updateFeedbackVisibility(@PathVariable("feedbackId") Long feedbackId,
      @RequestParam boolean isChecked) {
    feedbackService.updateFeedbackVisibility(feedbackId, isChecked);
    return new ResponseEntity<>(HttpStatus.OK);
  }

  @DeleteMapping("{feedbackId}")
  public ResponseEntity<Void> deleteFeedback(@PathVariable("feedbackId") Long feedbackId) {
    feedbackService.deleteFeedback(feedbackId);
    return new ResponseEntity<>(HttpStatus.NO_CONTENT);
  }

}
