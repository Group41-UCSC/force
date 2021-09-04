package com.project.royalscouts.dtos;

import java.util.List;

public class InstructionRequest {

  private Long taskId;

  private List<String> content;

  public InstructionRequest() {
  }

  public InstructionRequest(Long taskId, List<String> content) {
    this.taskId = taskId;
    this.content = content;
  }

  public Long getTaskId() {
    return taskId;
  }

  public void setTaskId(Long taskId) {
    this.taskId = taskId;
  }

  public List<String> getContent() {
    return content;
  }

  public void setContent(List<String> content) {
    this.content = content;
  }

}
