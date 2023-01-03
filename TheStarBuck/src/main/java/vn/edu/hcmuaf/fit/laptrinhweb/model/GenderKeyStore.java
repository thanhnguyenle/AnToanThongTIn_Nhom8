package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.*;
import java.security.KeyStore;

public class MyCertificate {
    private static MyCertificate instance;

    private MyCertificate() {
    }
    public static MyCertificate getInstance(){
        if(instance==null) instance = new MyCertificate();
        return instance;
    }

    public void createKeyStoreFile(String pathKeyStore, String passKeyStore){
        KeyStore ks = null;
        try {
            ks = KeyStore.getInstance("pkcs12");
            char[] pwdArray = passKeyStore.toCharArray();
            ks.load(null, pwdArray);
            try (FileOutputStream fos = new FileOutputStream(pathKeyStore)) {
                ks.store(fos, pwdArray);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        MyCertificate myCertificate = new MyCertificate();
        String path = "myStore.jks";
        myCertificate.createKeyStoreFile(path,"hello1");
        myCertificate.loadEntriesToKeyStoreFile(path,"hello1","123456","DSA","SHA256withDSA","2048","hi","hi","hi","hi","hi","hi");
        System.out.println("Succcessful");
    }
    public void loadEntriesToKeyStoreFile(String keyStorePath,String passKeyStore,String passPrivateKey,String keyAlgorithm, String sigAlgorithm,String keySize, String cn, String ou, String o, String s, String l, String c) {
        String command = "keytool -genkeypair -alias thestarbuck -keyalg "+keyAlgorithm+" -sigalg "+sigAlgorithm+" -keypass "+passPrivateKey+" -keysize "+keySize+" -validity 90 -keystore "  + keyStorePath;

        try {
            Process process = Runtime.getRuntime().exec(command);

            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(process.getOutputStream()));
            writer.write(passKeyStore);
            writer.write('\n');
            writer.write(cn);
            writer.write('\n');
            writer.write(ou);
            writer.write('\n');
            writer.write(o);
            writer.write('\n');
            writer.write(l);
            writer.write('\n');
            writer.write(s);
            writer.write('\n');
            writer.write(c);
            writer.write('\n');
            writer.write("yes");
            writer.flush();

            writer.close();

            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
