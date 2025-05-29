package model;

public class UserModel {
    private int id;
    private String fullName;
    private String username;
    private String email;
    private String password;
    private String role;
    private String phone;
    private String address;
    private byte[] profilePicture;

    // Default Constructor
    public UserModel() {
    }

    // Custom Constructor
    public UserModel(String fullName, String username, String email, String password, String role) {
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // Constructor without ID
    public UserModel(String fullName, String username, String email, String password, String role, String phone, String address, byte[] profilePicture) {
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.phone = phone;
        this.address = address;
        this.profilePicture = profilePicture;
    }

    // Fully Parameterized Constructor
    public UserModel(int id, String fullName, String username, String email, String password, String role, String phone, String address, byte[] profilePicture) {
        this.id = id;
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.phone = phone;
        this.address = address;
        this.profilePicture = profilePicture;
    }

    // Getter Methods
    public int getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public byte[] getProfilePicture() {
        return profilePicture;
    }

    // Setter Methods
    public void setId(int id) {
        this.id = id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setProfilePicture(byte[] profilePicture) {
        this.profilePicture = profilePicture;
    }
}
