package net.codejava.service;

import net.codejava.entity.Content;
import net.codejava.repository.ContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentService {
    @Autowired
    private ContentRepository repo;

    public List<Content> listAll(){
        return repo.findAll();
    }
    public void save(Content content){
        repo.save(content);
    }

    public Content get(Integer content_id){
        return repo.findById(content_id).get();
    }
    public void delete(Integer content_id){
        repo.deleteById(content_id);
    }

}
