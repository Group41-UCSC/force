package net.codejava.controller;

import net.codejava.entity.Permission;
import net.codejava.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
public class PermissionController {
    @Autowired
    private PermissionService service;

    @GetMapping("/permissions")
    public List<Permission> list(){
        return service.listAll();
    }

    @GetMapping("/permissions/{permission_id}")
    public ResponseEntity<Permission> get(@PathVariable Integer permission_id){
        try{
            Permission permission=service.get(permission_id);
            return new ResponseEntity<Permission>(permission, HttpStatus.OK);
        } catch(NoSuchElementException e){
            return new ResponseEntity<Permission>(HttpStatus.NOT_FOUND);
        }

    }


    @PostMapping("/add-permission")
    public void add(@RequestBody Permission permission){
        service.save(permission);
    }

    @PutMapping("/update-permission/{permission_id}")
    public ResponseEntity<?> update(@RequestBody Permission permission, @PathVariable Integer permission_id){
        try {
            Permission existPermission= service.get(permission_id);
            existPermission.setPermission_title(permission.getPermission_title());
            existPermission.setPermission_description(permission.getPermission_description());
            existPermission.setPermission_script(permission.getPermission_script());
            service.save(existPermission);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete-permission/{id}")
    public void delete(@PathVariable Integer id){
        service.delete(id);
    }
}
