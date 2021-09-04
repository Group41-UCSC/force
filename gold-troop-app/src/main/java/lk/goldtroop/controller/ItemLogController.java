package net.codejava.controller;

import net.codejava.entity.ItemLog;
import net.codejava.service.ItemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
public class ItemLogController {
    @Autowired
    private ItemLogService service;

    @GetMapping("/itemlogs")
    public List<ItemLog> list(){
        return service.listAll();
    }

    @GetMapping("/itemlogs/{itemlog_id}")
    public ResponseEntity<ItemLog> get(@PathVariable Integer itemlog_id){
        try{
            ItemLog itemlog=service.get(itemlog_id);
            return new ResponseEntity<ItemLog>(itemlog, HttpStatus.OK);
        } catch(NoSuchElementException e){
            return new ResponseEntity<ItemLog>(HttpStatus.NOT_FOUND);
        }

    }


    @PostMapping("/add-itemlog")
    public void add(@RequestBody ItemLog itemlog){
        service.save(itemlog);
    }

    @PutMapping("/update-itemlog/{itemlog_id}")
    public ResponseEntity<?> update(@RequestBody ItemLog itemlog, @PathVariable Integer itemlog_id){
        try {
            ItemLog existItemLog= service.get(itemlog_id);
            existItemLog.setItemlog_issuedto(itemlog.getItemlog_issuedto());
            existItemLog.setItemlog_quantity(itemlog.getItemlog_quantity());
            existItemLog.setItemlog_status(itemlog.getItemlog_status());
            existItemLog.setItemlog_purpose(itemlog.getItemlog_purpose());
            existItemLog.setItemlog_remarks(itemlog.getItemlog_remarks());
            service.save(existItemLog);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete-itemlog/{id}")
    public void delete(@PathVariable Integer id){
        service.delete(id);
    }
}
