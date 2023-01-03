package vn.edu.hcmuaf.fit.laptrinhweb.controller;

import java.io.*;
import java.math.BigInteger;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.util.Base64;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class NLUHash{
    
    MessageDigest md;
    public String name;

    public NLUHash(String name) {
        this.name = name;
        try {
            if(name.equals("MD5")){
                this.md = MessageDigest.getInstance(this.name);
            }else{
                // register the BouncyCastleProvider with the Security Manager
                Security.addProvider(new BouncyCastleProvider());   
                this.md = MessageDigest.getInstance(this.name);
                }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public void loadHashMethod(){
        try {
                // register the BouncyCastleProvider with the Security Manager
                Security.addProvider(new BouncyCastleProvider());   
                this.md = MessageDigest.getInstance(this.name);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public String hash(String data) {
        if (this.md == null) {
            return "";
        }
        byte[] out = this.md.digest(data.getBytes());
        BigInteger bi = new BigInteger(1, out);
        return bi.toString(16);
    }

    public String hashFile(String path) {
        if (this.md == null)
            return "";
        File f = new File(path);
        if (f.exists()) {
            try {
                DigestInputStream dis = new DigestInputStream(new BufferedInputStream(new FileInputStream(f)), this.md);
                int i;
                byte[] buff = new byte[1024];
                do {
                    i = dis.read(buff);
                } while (i != -1);
                BigInteger bi = new BigInteger(1, dis.getMessageDigest().digest());
                return bi.toString(16);
            } catch (IOException e) {
                // TODO: handle exception
            }
        }
        return "";
    }
    public String hashByte(InputStream inputStream){
        if (this.md == null)
            return "";
            try {
                DigestInputStream dis = new DigestInputStream(new BufferedInputStream(inputStream), this.md);
                int i;
                byte[] buff = new byte[1024];
                do {
                    i = dis.read(buff);
                } while (i != -1);
                BigInteger bi = new BigInteger(1, dis.getMessageDigest().digest());
                return new String(Base64.getEncoder().encode(bi.toByteArray()));
            } catch (IOException e) {
                e.printStackTrace();
            }

        return "";
    }
}
