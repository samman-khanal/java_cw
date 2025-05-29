package utils;

import org.mindrot.jbcrypt.BCrypt;

public class HashPasswordUtil {
    public static String hashPassword(String password) {
        // Hashing the password by generating salt.
        return BCrypt.hashpw(password, BCrypt.gensalt(12));
    }

    public static boolean checkPassword(String password, String hashedPassword) {
        // Verifying whether the password matches with the hashed password or not.
        return BCrypt.checkpw(password, hashedPassword);
    }

    // Maim method for debugging purpose.
    public static void main(String[] args) {

        // Sample password.
        String password = "samman@khanal@123";

        System.out.println("The password before hashing is: " + password);
        System.out.println("The password after hashing is: " + hashPassword(password));

        // Checking if both of the password matches or not.
        System.out.println(checkPassword(password, hashPassword(password)));
    }
}
