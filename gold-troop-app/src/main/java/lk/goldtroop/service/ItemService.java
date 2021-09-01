package net.codejava.service;

import net.codejava.entity.Item;
import net.codejava.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {

    @Autowired
    private ItemRepository repo;

    public List<Item> listAll(){
        return repo.findAll();
    }

    public List<Item> getItemStatus(String itemStatus){
            return repo.findByItemStatus(itemStatus);
    }


    public void save(Item item){
        repo.save(item);
    }

    public Item get(Integer item_id){
        return repo.findById(item_id).get();
    }
    public void delete(Integer item_id){
        repo.deleteById(item_id);
    }



}
