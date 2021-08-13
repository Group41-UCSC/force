package com.project.royalscouts.repositories;

import java.util.List;

import com.project.royalscouts.models.Feedback;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
  List<Feedback> findByTaskId(Long taskId);
}