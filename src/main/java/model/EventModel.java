package model;

public class EventModel {
    private int id;
    private String name;
    private String description;
    private String location;
    private String date;
    private String time;
    private String category;

    // Default Constructor
    public EventModel() {
    }

    // Constructor without ID
    public EventModel(String name, String description, String location, String date, String time, String category) {
        this.name = name;
        this.description = description;
        this.location = location;
        this.date = date;
        this.time = time;
        this.category = category;
    }

    // Fully Parameterized Constructor
    public EventModel(int id, String name, String description, String location, String date, String time, String category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.location = location;
        this.date = date;
        this.time = time;
        this.category = category;
    }

    // Getter Methods
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getLocation() {
        return location;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public String getCategory() {
        return category;
    }

    // Setter Methods
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
