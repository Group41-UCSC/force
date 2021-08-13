package com.project.royalscouts.dtos;

public class ReviewRequest {

  private Long taskId;

  private String reviewedBy;

  private String comments;

  private String permissionAction;

  private String frequency;

  public ReviewRequest() {
  }

  public Long getTaskId() {
    return taskId;
  }

  public void setTaskId(Long taskId) {
    this.taskId = taskId;
  }

  public String getReviewedBy() {
    return reviewedBy;
  }

  public void setReviewedBy(String reviewedBy) {
    this.reviewedBy = reviewedBy;
  }

  public String getComments() {
    return comments;
  }

  public void setComments(String comments) {
    this.comments = comments;
  }

  public String getPermissionAction() {
    return permissionAction;
  }

  public void setPermissionAction(String permissionAction) {
    this.permissionAction = permissionAction;
  }

  public String getFrequency() {
    return frequency;
  }

  public void setFrequency(String frequency) {
    this.frequency = frequency;
  }

}
