package com.project.royalscouts.controllers;

import java.util.List;

import com.project.royalscouts.dtos.EvaluationRequest;
import com.project.royalscouts.models.Evaluation;
import com.project.royalscouts.services.EvaluationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/evaluations")
@CrossOrigin("*")
public class EvaluationController {
  @Autowired
  EvaluationService evaluationService;

  @GetMapping
  public ResponseEntity<List<Evaluation>> getAllEvaluations() {
    return new ResponseEntity<>(evaluationService.getEvaluations(), HttpStatus.OK);
  }

  @PostMapping
  public ResponseEntity<Evaluation> createEvaluation(@RequestBody EvaluationRequest evaluationRequest) {
    return new ResponseEntity<>(evaluationService.addEvaluation(evaluationRequest), HttpStatus.CREATED);
  }

  @PutMapping("{evaluationId}")
  public ResponseEntity<Void> updateTask(@PathVariable("evaluationId") Long evaluationId,
      @RequestBody EvaluationRequest evaluationRequest) {
    evaluationService.updateEvaluation(evaluationId, evaluationRequest);
    return new ResponseEntity<>(HttpStatus.OK);
  }

  @DeleteMapping("{evaluationId}")
  public ResponseEntity<Void> deleteTask(@PathVariable("evaluationId") Long evaluationId) {
    evaluationService.deleteEvaluation(evaluationId);
    return new ResponseEntity<>(HttpStatus.NO_CONTENT);
  }

}
