package model;

public class ContactModel {
    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String message;

    // Default Constructor
    public ContactModel() {
    }

    // Constructor without ID
    public ContactModel(String fullName, String email, String phone, String address, String message) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.message = message;
    }

    // Fully Parameterized Constructor
    public ContactModel(int id, String fullName, String email, String phone, String address, String message) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.message = message;
    }

    // Getter Methods
    public int getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getMessage() {
        return message;
    }

    // Setter Methods

    public void setId(int id) {
        this.id = id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
