package net.codejava.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import java.sql.Blob;
@Entity
public class Content {

    private Integer content_id;
    private Integer scout_id;
    private String content_title;
    private String content_description;
    private String media;

    public Content() {
    }

    public Content(Integer content_id, Integer scout_id, String content_title, String content_description, String media) {
        this.content_id = content_id;
        this.scout_id = scout_id;
        this.content_title = content_title;
        this.content_description = content_description;
        this.media = media;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getContent_id() {
        return content_id;
    }

    public void setContent_id(Integer content_id) {
        this.content_id = content_id;
    }

    public Integer getScout_id() {
        return scout_id;
    }

    public void setScout_id(Integer scout_id) {
        this.scout_id = scout_id;
    }

    public String getContent_title() {
        return content_title;
    }

    public void setContent_title(String content_title) {
        this.content_title = content_title;
    }

    public String getContent_description() {
        return content_description;
    }

    public void setContent_description(String content_description) {
        this.content_description = content_description;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }
}
