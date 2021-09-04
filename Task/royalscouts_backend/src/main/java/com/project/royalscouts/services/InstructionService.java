package com.project.royalscouts.services;

import java.util.List;

import com.project.royalscouts.models.Instruction;
import com.project.royalscouts.models.Task;


public interface InstructionService {

  List<Instruction> getInstructions(Long taskId);

  void addInstructions(Task task, List<String> contents);
  
  void updateInstructions(Task task, List<String> contents);

}
