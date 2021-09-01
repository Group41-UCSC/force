package net.codejava.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Item {
    private Integer item_id;
    private String item_name;
    private String item_source;
    private Integer inventory_id;
    private Integer item_quantity;
    private Float item_lifespan;
    private Float item_price;
    private String item_build;
    private String itemStatus;
    private String item_description;

    public Item() {
    }

    public Item(Integer item_id, String item_name, String item_source, Integer inventory_id, Integer item_quantity, Float item_lifespan, Float item_price, String item_build, String itemStatus, String item_description) {
        this.item_id = item_id;
        this.item_name = item_name;
        this.item_source = item_source;
        this.inventory_id = inventory_id;
        this.item_quantity = item_quantity;
        this.item_lifespan = item_lifespan;
        this.item_price = item_price;
        this.item_build = item_build;
        this.itemStatus = itemStatus;
        this.item_description = item_description;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getItem_id() {
        return item_id;
    }

    public void setItem_id(Integer item_id) {
        this.item_id = item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getItem_source() {
        return item_source;
    }

    public void setItem_source(String item_source) {
        this.item_source = item_source;
    }

    public Integer getInventory_id() {
        return inventory_id;
    }

    public void setInventory_id(Integer inventory_id) {
        this.inventory_id = inventory_id;
    }

    public Integer getItem_quantity() {
        return item_quantity;
    }

    public void setItem_quantity(Integer item_quantity) {
        this.item_quantity = item_quantity;
    }

    public Float getItem_lifespan() {
        return item_lifespan;
    }

    public void setItem_lifespan(Float item_lifespan) {
        this.item_lifespan = item_lifespan;
    }

    public Float getItem_price() {
        return item_price;
    }

    public void setItem_price(Float item_price) {
        this.item_price = item_price;
    }

    public String getItem_build() {
        return item_build;
    }

    public void setItem_build(String item_build) {
        this.item_build = item_build;
    }

    public String getItem_status() {
        return itemStatus;
    }

    public void setItem_status(String item_status) {
        this.itemStatus = item_status;
    }

    public String getItem_description() {
        return item_description;
    }

    public void setItem_description(String item_description) {
        this.item_description = item_description;
    }
}
