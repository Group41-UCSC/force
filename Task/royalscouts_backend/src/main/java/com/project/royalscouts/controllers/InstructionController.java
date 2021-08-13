package com.project.royalscouts.controllers;

import java.util.List;

import com.project.royalscouts.models.Instruction;
import com.project.royalscouts.services.InstructionService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/instructions")
@CrossOrigin("*")
public class InstructionController {
  @Autowired
  InstructionService instructionService;

  @GetMapping
  public ResponseEntity<List<Instruction>> getAllInstructionsByTaskId(@RequestParam Long taskId) {
    List<Instruction> instructions = instructionService.getInstructions(taskId);
    return new ResponseEntity<>(instructions, HttpStatus.OK);
  }
}
