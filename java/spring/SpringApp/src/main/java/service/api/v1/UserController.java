package service.api.v1;

import database.Database;
import model.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.xml.crypto.Data;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

@RestController
@RequestMapping(value = "/api/1/user")
public class UserController {
    private final AtomicLong counter = new AtomicLong();

    @GetMapping()
    public List<User> index() {
        return Database.getInstance().users();
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable("id") long id) {
        User user = Database.getInstance().getUserById(id);
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @PostMapping()
    public ResponseEntity<?> createUser(@RequestBody Map<String, String> content) {
        if (!content.containsKey("username")) {
            String msg = "Property \"username\" is required for creating User.";
            return new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
        }
        User user = new User(counter.incrementAndGet(), content.get("username"));
        Database.getInstance().addUser(user);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") long id) {
        User user = Database.getInstance().getUserById(id);
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable("id") long id, @RequestBody Map<String, String> content) {
        User user = Database.getInstance().getUserById(id);
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        if (!content.containsKey("username")) {
            String msg = "Property \"username\" is required for updating User.";
            return new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
        }
        User updatedUser = new User(0, content.get("username"));
        user.update(updatedUser);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }
}
