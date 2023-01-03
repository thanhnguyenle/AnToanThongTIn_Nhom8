package vn.edu.hcmuaf.fit.laptrinhweb.model;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.*;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.security.cert.CertificateException;

public class PDFChecker {
    private static PDFChecker instance;

    private PDFChecker() {
    }
    public static PDFChecker getInstance(){
        if(instance==null) instance = new PDFChecker();
        return instance;
    }
    public KeyStore getKeyStore(String pathKeyStore, String passKeyStore){
        try {
            BouncyCastleProvider provider = new BouncyCastleProvider();
            Security.addProvider(provider);
            KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
            ks.load(new FileInputStream(pathKeyStore), passKeyStore.toCharArray());
            return ks;
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (CertificateException | KeyStoreException e) {
            throw new RuntimeException(e);
        }

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
