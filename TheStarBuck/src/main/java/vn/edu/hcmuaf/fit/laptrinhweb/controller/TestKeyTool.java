package vn.edu.hcmuaf.fit.laptrinhweb.controller;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.security.Security;

public class TestKeyTool {
    public static void main(String[] args){
//        BouncyCastleProvider provider = new BouncyCastleProvider();
//        Security.addProvider(provider);
//        generateKeyPair();
//        list();
        final Process p;
        try {
            p = Runtime.getRuntime().exec("keytool -genkeypair -alias thestarbuck -keyalg RSA -keystore newKeyStoreFileName.jks");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        new Thread(new Runnable() {
            public void run() {
                BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
                String line = null;

                try {
                    while ((line = input.readLine()) != null)
                        System.out.println(line);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }).start();

        try {
            p.waitFor();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    // List keystore
    public static void list(){
        String command = " -list "+
                " -v "+
                " -keystore mytest.jks "+
                " -storepass password";
        execute(command);
    }

    // Generate keypair
    public static void generateKeyPair(){
        String command = " -genkeypair "+
                " -alias mykey "+
                " -keyalg RSA "+
                " -sigalg SHA256withRSA "+
                " -dname CN=Java "+
                " -storetype JKS "+
                " -keypass password "+
                " -keystore mytest.jks "+
                " -storepass password";
        execute(command);
    }

    // Execute the commands
    public static void execute(String command){
        try{

//            Class<?> cl;
//            try {
//                // java 6 and 7
//                cl = ClassLoader.getSystemClassLoader().loadClass("sun.security.tools.Keytool");
//            } catch (ClassNotFoundException e) {
//                // java 8
//                cl = ClassLoader.getSystemClassLoader().loadClass("sun.security.tools.keytool.Main");
//            }
            Class<?> keytoolClazz = Class.forName("sun.security.tools.keytool.Main");
            printCommand(command);
            Method main = keytoolClazz.getMethod("main", String[].class);
            main.invoke(null, (Object) parse(command));
//            sun.security.tools.keytool.Main.main(parse(command));
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }

    // Parse command
    private static String[] parse(String command){
        String[] options = command.trim().split("\\s+");
        return options;
    }

    // Print the command
    private static void printCommand(String command){
        System.out.println(command);
    }
}
