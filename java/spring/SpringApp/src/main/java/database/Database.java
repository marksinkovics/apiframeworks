package database;

import model.User;

import java.util.ArrayList;
import java.util.List;

public class Database {

    private ArrayList<User> users = new ArrayList<>();

    private static final Database instance = new Database();
    private Database() {

    }
    public static Database getInstance() {
        return instance;
    }

    public List<User> users() {
        return users;
    }

    public void addUser(User user) {
        users.add(user);
    }

    public void removeUserById(long id) {
        User user = getUserById(id);
        if (user != null) {
            users.remove(user);
        }
    }

    public User getUserById(long id) {
        return users.stream()
                .filter(user -> id == user.getId())
                .findAny()
                .orElse(null);
    }

    public User getUserByUsername(String username) {
        return users.stream()
                .filter(user -> username.equals(user.getUsername()))
                .findAny()
                .orElse(null);
    }
}
