package com.project.royalscouts.services;

import java.util.List;

import com.project.royalscouts.dtos.EvaluationRequest;
import com.project.royalscouts.models.Evaluation;

public interface EvaluationService {

  List<Evaluation> getEvaluations();

  Evaluation addEvaluation(EvaluationRequest evaluationRequest);

  void updateEvaluation(Long evaluationId, EvaluationRequest evaluationRequest);

  void deleteEvaluation(Long evaluationId);

}
