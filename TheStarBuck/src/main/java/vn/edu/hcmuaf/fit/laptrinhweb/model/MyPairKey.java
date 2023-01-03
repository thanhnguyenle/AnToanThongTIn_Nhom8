package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.*;
import java.security.KeyStore;

public class MyPairKey {
   private String privateKey;
   private String publicKey;
   public String info;

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public MyPairKey(){}

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String toString() {
        return "PairKey [publicKey=" + publicKey + ", privateKey=" + privateKey + "]";
    }
}
