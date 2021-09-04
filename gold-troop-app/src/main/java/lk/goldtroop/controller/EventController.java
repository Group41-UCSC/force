package net.codejava.controller;

import net.codejava.entity.Event;
import net.codejava.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
public class EventController {
    @Autowired
    private EventService service;

    @GetMapping("/events")
    public List<Event> list(){
        return service.listAll();
    }

    @GetMapping("/events/{event_id}")
    public ResponseEntity<Event> get(@PathVariable Integer event_id){
        try{
            Event event=service.get(event_id);
            return new ResponseEntity<Event>(event, HttpStatus.OK);
        } catch(NoSuchElementException e){
            return new ResponseEntity<Event>(HttpStatus.NOT_FOUND);
        }

    }


    @PostMapping("/add-event")
    public void add(@RequestBody Event event){
        service.save(event);
    }

    @PutMapping("/update-event/{event_id}")
    public ResponseEntity<?> update(@RequestBody Event event, @PathVariable Integer event_id){
        try {
            Event existEvent= service.get(event_id);
            existEvent.setEvent_title(event.getEvent_title());
            existEvent.setEvent_description(event.getEvent_description());
            existEvent.setEvent_child_id(event.getEvent_child_id());
            existEvent.setEvent_category(event.getEvent_category());
            existEvent.setEvent_status(event.getEvent_status());
            existEvent.setEvent_feedback(event.getEvent_feedback());
            service.save(existEvent);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete-event/{id}")
    public void delete(@PathVariable Integer id){
        service.delete(id);
    }
}
