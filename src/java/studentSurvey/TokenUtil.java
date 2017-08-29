package studentSurvey;

/**
 * Created by Mensur on 29.8.2017..
 */

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.math.BigInteger;
import java.security.MessageDigest;

public class TokenUtil {

    private static String strkey ="0294-445c-bcd2";
    private static Base64 base64 = new Base64(true);
    private static final String BLOWFISH = "Blowfish";

    // encrypt using blowfish algorithm
    private static String encrypt(String Data)throws Exception {
        SecretKeySpec key = new SecretKeySpec(strkey.getBytes("UTF8"), BLOWFISH);
        Cipher cipher = Cipher.getInstance(BLOWFISH);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        return base64.encodeToString(cipher.doFinal(Data.getBytes("UTF8")));
    }

    // decrypt using blow fish algorithm
    public static String decrypt(String encrypted)throws Exception {
        byte[] encryptedData = base64.decodeBase64(encrypted);
        SecretKeySpec key = new SecretKeySpec(strkey.getBytes("UTF8"), BLOWFISH);
        Cipher cipher = Cipher.getInstance(BLOWFISH);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decrypted = cipher.doFinal(encryptedData);
        return new String(decrypted);
    }

    // encrypt token (used on server)
    public static String generateToken(String userName) throws Exception {
        String result = "";
        if (userName != null) {
            // MD5
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(userName.getBytes());
            BigInteger hash = new BigInteger(1, md5.digest());
            String md5Username = hash.toString(16);

            result = encrypt(userName + "|" + md5Username);
        }
        return result;
    }

    public static String generateEncryptedDateTime(String dateTimeMsStr) throws Exception {
        String result = "";
        if (dateTimeMsStr != null) {
            result = encrypt(dateTimeMsStr.toString());
        }
        return result;
    }

    public static String decryptDateTime(String token) throws Exception {
        String result = "";
        if (token != null) {
            result = decrypt(token);
        }
        return result;
    }

    public static String getUserNameFromToken(String encryptedToken) throws Exception {
        String result = null;
        String decrypted = decrypt(encryptedToken);
        if (decrypted != null) {
            int delimiterIndex = decrypted.indexOf('|');

            String suggestedUserName = decrypted.substring(0, delimiterIndex);

            String md5 = decrypted.substring(delimiterIndex + 1, decrypted.length());

            // MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(suggestedUserName.getBytes());
            BigInteger hash = new BigInteger(1, md.digest());
            String md5suggestedUserName = hash.toString(16);

            if (suggestedUserName != null && md5 != null && md5suggestedUserName.equals(md5)) {
                result = suggestedUserName;
            }
        }
        return result;
    }

}

