package net.codejava.controller;

import net.codejava.entity.Item;
import net.codejava.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
public class ItemController {
    @Autowired
    private ItemService service;

    @GetMapping("/items")
    public List<Item> list(){
        return service.listAll();
    }

    @GetMapping("/items/category/{itemStatus}")
    public List<Item> findItemStatus(@PathVariable (value="itemStatus") String itemStatus){
            return service.getItemStatus(itemStatus);

    }

    @GetMapping("/items/{item_id}")
    public ResponseEntity<Item> get(@PathVariable Integer item_id){
        try{
            Item item=service.get(item_id);
            return new ResponseEntity<Item>(item, HttpStatus.OK);
        } catch(NoSuchElementException e){
            return new ResponseEntity<Item>(HttpStatus.NOT_FOUND);
        }

    }


    @PostMapping("/add-item")
    public void add(@RequestBody Item item){
        service.save(item);
    }

    @PutMapping("/update-item/{item_id}")
    public ResponseEntity<?> update(@RequestBody Item item, @PathVariable Integer item_id){
        try {
            Item existItem= service.get(item_id);
            existItem.setItem_name(item.getItem_name());
            existItem.setItem_source(item.getItem_source());
            existItem.setInventory_id(item.getInventory_id());
            existItem.setItem_quantity(item.getItem_quantity());
            existItem.setItem_lifespan(item.getItem_lifespan());
            existItem.setItem_price(item.getItem_price());
            existItem.setItem_build(item.getItem_build());
            existItem.setItem_status(item.getItem_status());
            existItem.setItem_description(item.getItem_description());
            service.save(existItem);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete-item/{id}")
    public void delete(@PathVariable Integer id){
        service.delete(id);
    }
}
