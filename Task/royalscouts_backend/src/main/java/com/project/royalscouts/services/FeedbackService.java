package com.project.royalscouts.services;

import java.util.List;

import com.project.royalscouts.dtos.FeedbackRequest;
import com.project.royalscouts.models.Feedback;

public interface FeedbackService {

  List<Feedback> getFeedbacks(Long taskId);

  Feedback addFeedback(FeedbackRequest feedbackRequest);

  void updateFeedbackVisibility(Long feedbackId, boolean isChecked);

  void deleteFeedback(Long feedbackId);

}
