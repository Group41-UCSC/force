package com.project.royalscouts.dtos;

public class StatusRequest {
  private String approvedBy;

  private String status;

  public StatusRequest() {
  }

  public StatusRequest(String approvedBy, String status) {
    this.approvedBy = approvedBy;
    this.status = status;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getApprovedBy() {
    return approvedBy;
  }

  public void setApprovedBy(String approvedBy) {
    this.approvedBy = approvedBy;
  }
}
