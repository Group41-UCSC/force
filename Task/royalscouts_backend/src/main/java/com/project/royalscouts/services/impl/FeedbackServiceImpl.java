package com.project.royalscouts.services.impl;

import java.util.List;
import java.util.Optional;

import com.project.royalscouts.dtos.FeedbackRequest;
import com.project.royalscouts.exceptions.ResourceNotFoundException;
import com.project.royalscouts.models.Feedback;
import com.project.royalscouts.repositories.FeedbackRepository;
import com.project.royalscouts.repositories.TaskRepository;
import com.project.royalscouts.services.FeedbackService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class FeedbackServiceImpl implements FeedbackService {

  @Autowired
  TaskRepository taskRepository;

  @Autowired
  private FeedbackRepository feedbackRepository;

  @Autowired
  private JavaMailSender javaMailSender;

  void sendFeedbackEmail(Feedback feedback) {
    SimpleMailMessage msg = new SimpleMailMessage();

    // get leader email address
    msg.setTo("123@gmail.com", "123@gmail.com");
    msg.setSubject("Feedback created");
    msg.setText("A new feedback has been created by " + feedback.getCreatedBy());
    javaMailSender.send(msg);
  }

  @Override
  public List<Feedback> getFeedbacks(Long taskId) {
    return feedbackRepository.findByTaskId(taskId);
  }

  @Override
  public Feedback addFeedback(FeedbackRequest feedbackRequest) {
    Feedback newFeedback = new Feedback();
    newFeedback.setRating(feedbackRequest.getRating());
    newFeedback.setContent(feedbackRequest.getContent());
    newFeedback.setCreatedBy(feedbackRequest.getCreatedBy());
    newFeedback.setChecked(feedbackRequest.isChecked());

    Feedback addedFeedback = taskRepository.findById(feedbackRequest.getTaskId()).map(task -> {
      newFeedback.setTask(task);
      return feedbackRepository.save(newFeedback);
    }).orElseThrow(() -> new ResourceNotFoundException());

    // sendFeedbackEmail(addedFeedback);
    
    return addedFeedback;
  }

  @Override
  public void updateFeedbackVisibility(Long feedbackId, boolean isChecked) {
    Optional<Feedback> feedbackFromDb = feedbackRepository.findById(feedbackId);
    if (feedbackFromDb.isPresent()) {
      feedbackFromDb.get().setChecked(isChecked);
      feedbackRepository.save(feedbackFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }

  @Override
  public void deleteFeedback(Long feedbackId) {
    Optional<Feedback> feedbackFromDb = feedbackRepository.findById(feedbackId);
    if (feedbackFromDb.isPresent()) {
      feedbackRepository.delete(feedbackFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }
}
