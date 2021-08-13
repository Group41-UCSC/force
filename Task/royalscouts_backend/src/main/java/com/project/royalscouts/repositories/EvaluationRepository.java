package com.project.royalscouts.repositories;

import com.project.royalscouts.models.Evaluation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EvaluationRepository extends JpaRepository<Evaluation, Long> {
}