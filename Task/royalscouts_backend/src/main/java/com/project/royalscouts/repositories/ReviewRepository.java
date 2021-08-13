package com.project.royalscouts.repositories;

import java.util.List;

import com.project.royalscouts.models.Review;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
  List<Review> findByTaskId(Long taskId);
}