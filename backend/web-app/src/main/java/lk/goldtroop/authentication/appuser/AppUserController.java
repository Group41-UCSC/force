//package lk.goldtroop.authentication.appuser;
//
//import lk.goldtroop.authentication.appuser.AppUser;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.NoSuchElementException;
//
//public class AppUserController {
//    @Autowired
//    private AppUserService service;
//
//    @GetMapping("/users")
//    public List<AppUser> list(){
//        return service.listAll();
//    }
//
////    @GetMapping("/items/category/{item_status}")
////    public List<Item> findItemStatus(@PathVariable(value="item_status") String item_status){
////        return service.getItemStatus(item_status);
////    }
////    @GetMapping("items/search/{keyword}")
////    public List<Item> findByKeyword(@PathVariable String keyword){
////        return service.getByKeyword(keyword);
////    }
//
//    @GetMapping("/users/{user_id}")
//    public ResponseEntity<AppUser> get(@PathVariable Integer id){
//        try{
//            AppUser user=service.get(id);
//            return new ResponseEntity<AppUser>(user, HttpStatus.OK);
//        } catch(NoSuchElementException e){
//            return new ResponseEntity<AppUser>(HttpStatus.NOT_FOUND);
//        }
//
//    }
//
//
//    @PostMapping("/add-user")
//    public void add(@RequestBody AppUser user){
//        service.save(user);
//    }
//
//    @PutMapping("/update-user/{id}")
//    public ResponseEntity<?> update(@RequestBody AppUser user, @PathVariable Long id){
//        try {
//            Item existUser= service.get(id);
//            existUser.setItemName(user.getItemName());
//            existUser.setItemSource(user.getItemSource());
//            existUser.setInventoryId(user.getInventoryId());
//            existUser.setItemQuantity(user.getItemQuantity());
//            existUser.setItemLifespan(user.getItemLifespan());
//            existUser.setItemPrice(user.getItemPrice());
//            existUser.setItemBuild(user.getItemBuild());
//            existUser.setItemStatus(user.getItemStatus());
//            existUser.setItemDescription(user.getItemDescription());
//            service.save(existUser);
//            return new ResponseEntity<>(HttpStatus.OK);
//        } catch (NoSuchElementException e){
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
//
//    @DeleteMapping("/delete-user/{id}")
//    public void delete(@PathVariable Long id){
//        service.delete(id);
//    }
//}
