package net.codejava.service;

import net.codejava.entity.Evaluvation;
import net.codejava.repository.EvaluvationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluvationService {

    @Autowired
    public EvaluvationRepository repo;

    public List<Evaluvation> listAll(){
        return repo.findAll();
    }
    public void save(Evaluvation evaluvation){
        repo.save(evaluvation);
    }

    public Evaluvation get(Integer evaluvation_id){
        return repo.findById(evaluvation_id).get();
    }
    public void delete(Integer evaluvation_id){
        repo.deleteById(evaluvation_id);
    }
}
