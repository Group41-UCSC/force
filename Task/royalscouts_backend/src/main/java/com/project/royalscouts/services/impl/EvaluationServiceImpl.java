package com.project.royalscouts.services.impl;

import java.util.List;
import java.util.Optional;

import com.project.royalscouts.dtos.EvaluationRequest;
import com.project.royalscouts.exceptions.ResourceNotFoundException;
import com.project.royalscouts.models.Evaluation;
import com.project.royalscouts.repositories.EvaluationRepository;
import com.project.royalscouts.repositories.TaskRepository;
import com.project.royalscouts.services.EvaluationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EvaluationServiceImpl implements EvaluationService {

  @Autowired
  TaskRepository taskRepository;

  @Autowired
  private EvaluationRepository evaluationRepository;

  @Override
  public List<Evaluation> getEvaluations() {
    return evaluationRepository.findAll();
  }

  @Override
  public Evaluation addEvaluation(EvaluationRequest evaluationRequest) {
    Evaluation newEvaluation = new Evaluation();
    newEvaluation.setTitle(evaluationRequest.getTitle());
    newEvaluation.setTaskId(evaluationRequest.getTaskId());
    newEvaluation.setStartDate(evaluationRequest.getStartDate());
    newEvaluation.setEndDate(evaluationRequest.getEndDate());
    newEvaluation.setVersion(1.0);
    newEvaluation.setCreatedBy(evaluationRequest.getCreatedBy());
    return evaluationRepository.save(newEvaluation);
  }

  @Override
  public void updateEvaluation(Long evaluationId, EvaluationRequest evaluationRequest) {
    Optional<Evaluation> evaluationFromDb = evaluationRepository.findById(evaluationId);
    if (evaluationFromDb.isPresent()) {
      evaluationFromDb.get().setTitle(evaluationRequest.getTitle());
      evaluationFromDb.get().setTaskId(evaluationRequest.getTaskId());
      evaluationFromDb.get().setStartDate(evaluationRequest.getStartDate());
      evaluationFromDb.get().setEndDate(evaluationRequest.getEndDate());
      evaluationFromDb.get().setVersion(evaluationFromDb.get().getVersion() + 0.1);
      evaluationRepository.save(evaluationFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }

  @Override
  public void deleteEvaluation(Long evaluationId) {
    Optional<Evaluation> evaluationFromDb = evaluationRepository.findById(evaluationId);
    if (evaluationFromDb.isPresent()) {
      evaluationRepository.delete(evaluationFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }
}
