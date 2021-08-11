package com.royalscouts.goldtroopapp.service;

import com.royalscouts.goldtroopapp.entity.Inventory;
import com.royalscouts.goldtroopapp.repository.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InventoryService {
    @Autowired
    private InventoryRepository repository;

    public Inventory saveInventory(Inventory inventory) {
        return repository.save(inventory);
    }

    public List<Inventory> saveInventories(List<Inventory> inventories) {
        return repository.saveAll(inventories);
    }

    public List<Inventory> getInventories() {
        return repository.findAll();
    }

    public Inventory getInventoryById(int inventoryID) {
        return repository.findById(inventoryID).orElse(null);
    }

    public Inventory getInventoryByCategory(String category) {
        return repository.findByName(category);
    }

    public String deleteInventory(int inventoryID) {
        repository.deleteById(inventoryID);
        return "Inventory removed !! " + inventoryID;
    }

    public Inventory updateInventory(Inventory inventory) {
        Inventory existingInventory = repository.findById(inventory.getInventoryID()).orElse(null);
        existingInventory.setCategory(inventory.getCategory());
        existingInventory.setDescription(inventory.getDescription());
        return repository.save(existingInventory);
    }
}
