package com.royalscouts.goldtroopapp.controller;

import com.royalscouts.goldtroopapp.entity.Inventory;
import com.royalscouts.goldtroopapp.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class InventoryController {
    @Autowired
    private InventoryService service;

    @PostMapping("/addInventory")
    public Inventory addInventories(@RequestBody Inventory inventory) {
        return service.saveInventory(inventory);
    }

    @PostMapping("/addInventories")
    public List<Inventory> addInventories(@RequestBody List<Inventory> inventories) {
        return service.saveInventories(inventories);
    }

    @GetMapping("/Inventories")
    public List<Inventory> findAllInventories() {
        return service.getInventories();
    }

    @GetMapping("/inventoryById/{id}")
    public Inventory findInventoryById(@PathVariable int inventoryID) {
        return service.getInventoryById(inventoryID);
    }

    @GetMapping("/inventoryByCategory/{name}")
    public Inventory findInventoryByCategory(@PathVariable String category) {
        return service.getInventoryByCategory(category);
    }

    @PutMapping("/updateInventory")
    public Inventory updateInventory(@RequestBody Inventory inventory) {
        return service.updateInventory(inventory);
    }

    @DeleteMapping("/deleteInventory/{inventoryID}")
    public String deleteInventory(@PathVariable int inventoryID) {
        return service.deleteInventory(inventoryID);
    }
}
