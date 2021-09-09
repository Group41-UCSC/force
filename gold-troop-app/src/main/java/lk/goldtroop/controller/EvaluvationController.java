package net.codejava.controller;

import net.codejava.entity.Evaluvation;
import net.codejava.service.EvaluvationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.NoSuchElementException;

@RestController
public class EvaluvationController {
    @Autowired
    private EvaluvationService service;

    @GetMapping("/evaluvations")
    public List<Evaluvation> list(){
        return service.listAll();
    }

    @GetMapping("/evaluvations/{evaluvation_id}")
    public ResponseEntity<Evaluvation> get(@PathVariable Integer evaluvation_id){
        try{
            Evaluvation evaluvation=service.get(evaluvation_id);
            return new ResponseEntity<Evaluvation>(evaluvation, HttpStatus.OK);
        } catch(NoSuchElementException e){
            return new ResponseEntity<Evaluvation>(HttpStatus.NOT_FOUND);
        }

    }


    @PostMapping("/add-evaluvation")
    public void add(@RequestBody Evaluvation evaluvation){
        service.save(evaluvation);
    }

    @PutMapping("/update-evaluvation/{evaluvation_id}")
    public ResponseEntity<?> update(@RequestBody Evaluvation evaluvation, @PathVariable Integer evaluvation_id){
        try {
            Evaluvation existEvaluvation= service.get(evaluvation_id);
            existEvaluvation.setEvaluvation_title(evaluvation.getEvaluvation_title());
            existEvaluvation.setEvaluvation_version(evaluvation.getEvaluvation_version());
            existEvaluvation.setEvaluvation_startdate(evaluvation.getEvaluvation_startdate());
            existEvaluvation.setEvaluvation_enddate(evaluvation.getEvaluvation_enddate());
            service.save(existEvaluvation);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete-evaluvation/{id}")
    public void delete(@PathVariable Integer id){
        service.delete(id);
    }
}
