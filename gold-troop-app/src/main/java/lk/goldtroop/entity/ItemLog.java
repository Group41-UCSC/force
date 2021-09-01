package net.codejava.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ItemLog {
    private Integer itemlog_id;
    private Integer item_id;
    private String itemlog_issuedto;
    private Integer itemlog_quantity;
    private String itemlog_status;
    private String itemlog_purpose;
    private String itemlog_remarks;

    public ItemLog() {
    }

    public ItemLog(Integer itemlog_id, Integer item_id, String itemlog_issuedto, Integer itemlog_quantity, String itemlog_status, String itemlog_purpose, String itemlog_remarks) {
        this.itemlog_id = itemlog_id;
        this.item_id = item_id;
        this.itemlog_issuedto = itemlog_issuedto;
        this.itemlog_quantity = itemlog_quantity;
        this.itemlog_status = itemlog_status;
        this.itemlog_purpose = itemlog_purpose;
        this.itemlog_remarks = itemlog_remarks;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getItemlog_id() {
        return itemlog_id;
    }

    public void setItemlog_id(Integer itemlog_id) {
        this.itemlog_id = itemlog_id;
    }

    public Integer getItem_id() {
        return item_id;
    }

    public void setItem_id(Integer item_id) {
        this.item_id = item_id;
    }

    public String getItemlog_issuedto() {
        return itemlog_issuedto;
    }

    public void setItemlog_issuedto(String itemlog_issuedto) {
        this.itemlog_issuedto = itemlog_issuedto;
    }

    public Integer getItemlog_quantity() {
        return itemlog_quantity;
    }

    public void setItemlog_quantity(Integer itemlog_quantity) {
        this.itemlog_quantity = itemlog_quantity;
    }

    public String getItemlog_status() {
        return itemlog_status;
    }

    public void setItemlog_status(String itemlog_status) {
        this.itemlog_status = itemlog_status;
    }

    public String getItemlog_purpose() {
        return itemlog_purpose;
    }

    public void setItemlog_purpose(String itemlog_purpose) {
        this.itemlog_purpose = itemlog_purpose;
    }

    public String getItemlog_remarks() {
        return itemlog_remarks;
    }

    public void setItemlog_remarks(String itemlog_remarks) {
        this.itemlog_remarks = itemlog_remarks;
    }
}
