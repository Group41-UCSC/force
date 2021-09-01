package net.codejava.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Permission {
    private Integer permission_id;
    private String permission_title;
    private String permission_description;
    private String permission_script;

    public Permission() {
    }

    public Permission(Integer permission_id, String permission_title, String permission_description, String permission_script) {
        this.permission_id = permission_id;
        this.permission_title = permission_title;
        this.permission_description = permission_description;
        this.permission_script = permission_script;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getPermission_id() {
        return permission_id;
    }

    public void setPermission_id(Integer permission_id) {
        this.permission_id = permission_id;
    }

    public String getPermission_title() {
        return permission_title;
    }

    public void setPermission_title(String permission_title) {
        this.permission_title = permission_title;
    }

    public String getPermission_description() {
        return permission_description;
    }

    public void setPermission_description(String permission_description) {
        this.permission_description = permission_description;
    }

    public String getPermission_script() {
        return permission_script;
    }

    public void setPermission_script(String permission_script) {
        this.permission_script = permission_script;
    }
}
