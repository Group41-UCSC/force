package net.codejava.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {
    private Integer event_id;
    private String event_title;
    private String event_description;
    private Integer event_child_id;
    private String event_category;
    private String event_status;
    private String event_feedback;

    public Event() {
    }

    public Event(Integer event_id, String event_title, String event_description, Integer event_child_id, String event_category, String event_status, String event_feedback) {
        this.event_id = event_id;
        this.event_title = event_title;
        this.event_description = event_description;
        this.event_child_id = event_child_id;
        this.event_category = event_category;
        this.event_status = event_status;
        this.event_feedback = event_feedback;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getEvent_id() {
        return event_id;
    }

    public void setEvent_id(Integer event_id) {
        this.event_id = event_id;
    }

    public String getEvent_title() {
        return event_title;
    }

    public void setEvent_title(String event_title) {
        this.event_title = event_title;
    }

    public String getEvent_description() {
        return event_description;
    }

    public void setEvent_description(String event_description) {
        this.event_description = event_description;
    }

    public Integer getEvent_child_id() {
        return event_child_id;
    }

    public void setEvent_child_id(Integer event_child_id) {
        this.event_child_id = event_child_id;
    }

    public String getEvent_category() {
        return event_category;
    }

    public void setEvent_category(String event_category) {
        this.event_category = event_category;
    }

    public String getEvent_status() {
        return event_status;
    }

    public void setEvent_status(String event_status) {
        this.event_status = event_status;
    }

    public String getEvent_feedback() {
        return event_feedback;
    }

    public void setEvent_feedback(String event_feedback) {
        this.event_feedback = event_feedback;
    }
}
