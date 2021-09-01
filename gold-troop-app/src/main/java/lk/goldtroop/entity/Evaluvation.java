package net.codejava.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Evaluvation {
    private Integer evaluvation_id;
    private Integer evaluvation_child_id;
    private String evaluvation_title;
    private String evaluvation_version;
    private String evaluvation_startdate;
    private String evaluvation_enddate;

    public Evaluvation() {
    }

    public Evaluvation(Integer evaluvation_id, Integer evaluvation_child_id, String evaluvation_title, String evaluvation_version, String evaluvation_startdate, String evaluvation_enddate) {
        this.evaluvation_id = evaluvation_id;
        this.evaluvation_child_id = evaluvation_child_id;
        this.evaluvation_title = evaluvation_title;
        this.evaluvation_version = evaluvation_version;
        this.evaluvation_startdate = evaluvation_startdate;
        this.evaluvation_enddate = evaluvation_enddate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getEvaluvation_id() {
        return evaluvation_id;
    }

    public void setEvaluvation_id(Integer evaluvation_id) {
        this.evaluvation_id = evaluvation_id;
    }

    public Integer getEvaluvation_child_id() {
        return evaluvation_child_id;
    }

    public void setEvaluvation_child_id(Integer evaluvation_child_id) {
        this.evaluvation_child_id = evaluvation_child_id;
    }

    public String getEvaluvation_title() {
        return evaluvation_title;
    }

    public void setEvaluvation_title(String evaluvation_title) {
        this.evaluvation_title = evaluvation_title;
    }

    public String getEvaluvation_version() {
        return evaluvation_version;
    }

    public void setEvaluvation_version(String evaluvation_version) {
        this.evaluvation_version = evaluvation_version;
    }

    public String getEvaluvation_startdate() {
        return evaluvation_startdate;
    }

    public void setEvaluvation_startdate(String evaluvation_startdate) {
        this.evaluvation_startdate = evaluvation_startdate;
    }

    public String getEvaluvation_enddate() {
        return evaluvation_enddate;
    }

    public void setEvaluvation_enddate(String evaluvation_enddate) {
        this.evaluvation_enddate = evaluvation_enddate;
    }
}
