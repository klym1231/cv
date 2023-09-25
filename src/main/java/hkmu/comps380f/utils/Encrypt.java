package hkmu.comps380f.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encrypt {

    public static String encryptPassword(String password) throws NoSuchAlgorithmException {
    final MessageDigest digest = MessageDigest.getInstance("SHA3-256");
    byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
    String encoded_password = Base64.getEncoder().encodeToString(hash);
    return encoded_password;
    }
}
