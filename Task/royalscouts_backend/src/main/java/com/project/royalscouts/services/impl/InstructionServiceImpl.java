package com.project.royalscouts.services.impl;

import java.util.List;

import com.project.royalscouts.models.Instruction;
import com.project.royalscouts.models.Task;
import com.project.royalscouts.repositories.InstructionRepository;
import com.project.royalscouts.repositories.TaskRepository;
import com.project.royalscouts.services.InstructionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InstructionServiceImpl implements InstructionService {

  @Autowired
  TaskRepository taskRepository;

  @Autowired
  private InstructionRepository instructionRepository;

  @Override
  public List<Instruction> getInstructions(Long taskId) {
    return instructionRepository.findByTaskId(taskId);
  }

  @Override
  public void addInstructions(Task task, List<String> contents) {
    for (String content : contents) {
      if (content != null) {
        instructionRepository.save(new Instruction(task, content));
      }
    }
  }

  @Override
  public void updateInstructions(Task task, List<String> contents) {

    List<Instruction> instructions = instructionRepository.findByTaskId(task.getId());
    instructionRepository.deleteAll(instructions);

    for (String content : contents) {
      if (content != null) {
        instructionRepository.save(new Instruction(task, content));
      }
    }
  }
}
