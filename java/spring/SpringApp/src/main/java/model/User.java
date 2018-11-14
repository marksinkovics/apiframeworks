package model;

public class User {
    private final long id;
    private String username;

    public User(long id, String username) {
        this.id = id;
        this.username = username;
    }

    public long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void update(User user) {
        this.username = user.username;
    }
}
