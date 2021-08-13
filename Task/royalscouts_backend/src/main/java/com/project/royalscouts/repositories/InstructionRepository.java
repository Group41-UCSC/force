package com.project.royalscouts.repositories;

import java.util.List;

import com.project.royalscouts.models.Instruction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InstructionRepository extends JpaRepository<Instruction, Long> {
  List<Instruction> findByTaskId(Long taskId);
}