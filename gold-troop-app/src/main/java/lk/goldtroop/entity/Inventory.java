package lk.goldtroop.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Inventory {
    private Integer inventory_id;
    private String category;
    private String description;

    public Inventory() {
    }


    public Inventory(Integer inventory_id, String category, String description) {
        this.inventory_id = inventory_id;
        this.category = category;
        this.description = description;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getInventory_id() {
        return inventory_id;
    }

    public void setInventory_id(Integer inventory_id) {
        this.inventory_id = inventory_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
