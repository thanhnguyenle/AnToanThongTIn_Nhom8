package vn.edu.hcmuaf.fit.laptrinhweb.model;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class RSACypher {
    KeyPair keyPair;
    PublicKey publicKey;
    PrivateKey privateKey;
    String algorithm = "RSA/ECB/PKCS1Padding";
    Charset charset = StandardCharsets.ISO_8859_1;
    public RSACypher() {

    }

    public byte[] encrypt(byte[] content,Key key) {
        if (key == null)
            createKey();
        if (content == null)
            return null;
        // byte[] data = content.getBytes(charset);
        try {
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] bytes = cipher.doFinal(content);
            return bytes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public byte[] decrypt(byte[] content,Key key) {
        if (key == null)
            return null;
        if (content == null)
            return null;
        // byte[] data = content.getBytes(charset);
        try {
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(Cipher.DECRYPT_MODE, key);
            byte[] bytes = cipher.doFinal(content);
            return bytes;
        } catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | BadPaddingException |
                 IllegalBlockSizeException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void createKey() {
        try {
            KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA");
            kpg.initialize(2048);
            keyPair = kpg.generateKeyPair();
            publicKey = keyPair.getPublic();
            privateKey = keyPair.getPrivate();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        RSACypher rsa = new RSACypher();
        rsa.createKey();
        byte[] en = rsa.encrypt("KHOA CÔNG NGHỆ THÔNG TIN NLU".getBytes(rsa.charset),rsa.publicKey);
        byte[] encodedBytes = Base64.getEncoder().encode(en);
        System.out.println("encodedBytes " + new String(encodedBytes));

        //decrypt
        byte[] decodeBase64 = Base64.getDecoder().decode(encodedBytes);
        byte[] de = rsa.decrypt(decodeBase64,rsa.privateKey);
        System.out.println("decodedBytes " + new String(de,rsa.charset));

//        PublicKey publicKeyNew = null;
//        try {
//            publicKeyNew = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(rsa.publicKey.getEncoded()));
//        } catch (InvalidKeySpecException | NoSuchAlgorithmException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
        // byte[] en2 = rsa.encrypt("KHOA CÔNG NGHỆ THÔNG TIN NLU".getBytes(rsa.charset),publicKeyNew);
        // System.out.println(en2.length);
        // byte[] de = rsa.decrypt(en,rsa.privateKey);
        // byte[] de2 = rsa.decrypt(en2,rsa.privateKey);
        // System.out.println(new String(en,rsa.charset)+" -> "+new String(de,rsa.charset));
        // System.out.println(new String(en2,rsa.charset)+" -> "+new String(de2,rsa.charset));
//        rsa.decrypt(new byte[256], rsa.privateKey);
    }

    public void loadKey(String path) {
        File file = new File(path);
        long size = file.length();
        try {
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            byte[] data = new byte[(int)size];
            bis.read(data, 0, (int)size);
            try {
                publicKey = KeyFactory.getInstance(algorithm).generatePublic(new X509EncodedKeySpec(data));
            } catch (InvalidKeySpecException | NoSuchAlgorithmException e) {

                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public String encrypt(String content) {
        byte[] data = content.getBytes();
        byte[] dataEncrypt =  encrypt(data, publicKey);
        byte[] encodedBytes = Base64.getEncoder().encode(dataEncrypt);
        return new String(encodedBytes);
    }

    public String decrypt(String content) {
        byte[] data = content.getBytes();
        byte[] encodedBytes = Base64.getEncoder().encode(data);
        byte[] dataEncrypt =  decrypt(encodedBytes, publicKey);
        return new String(dataEncrypt,charset);
    }

}
