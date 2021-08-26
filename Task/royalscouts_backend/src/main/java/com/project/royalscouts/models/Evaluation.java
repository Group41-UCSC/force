package com.project.royalscouts.models;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "evaluations")
public class Evaluation extends AuditModel {

  @Column(name = "version")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long version;

  @Column(name = "title")
  private String title;

  @Column(name = "start_date")
  @Temporal(TemporalType.TIMESTAMP)
  private Date startDate;

  @Column(name = "end_date")
  @Temporal(TemporalType.TIMESTAMP)
  private Date endDate;

  public Evaluation() {
  }

  public Evaluation(Long version, String title, Date startDate, Date endDate) {
    this.version = version;
    this.title = title;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  public Long getVersion() {
    return version;
  }

  public void setVersion(Long version) {
    this.version = version;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

}
