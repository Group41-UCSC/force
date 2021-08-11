package com.royalscouts.goldtroopapp.repository;

import com.royalscouts.goldtroopapp.entity.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventoryRepository extends JpaRepository<Inventory,Integer> {
    Inventory findByName(String name);

}
