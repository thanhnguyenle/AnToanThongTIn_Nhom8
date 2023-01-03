package org.example.view;

import javax.swing.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

public class LoginControl {
    private static String password;

    public static String getPassword() throws FileNotFoundException {

        File pinFile = new File("src/main/java/org/example/view/PinPass.txt");
        Scanner myReader = new Scanner(pinFile);
        return myReader.nextLine();
    }

    private void writePassword(String newPass) throws FileNotFoundException {
        File pinFile = new File("src/main/java/org/example/view/PinPass.txt");
        PrintWriter writer = new PrintWriter(pinFile);
        writer.print(newPass);
        writer.close();
    }


    private void clearPass() throws FileNotFoundException {
        File pinFile = new File("src/main/java/org/example/view/PinPass.txt");
        PrintWriter writer = new PrintWriter(pinFile);
        writer.print("");
        writer.close();
    }

    public static boolean isLoginSuccessfully(String inputPassword) throws FileNotFoundException {
        String currentPassword = getPassword();
        return password.equals(inputPassword);

    }

    ;

    public int changePassword(String oldPassword, String newPassword) throws FileNotFoundException {
        String currentPassword = getPassword();
        if (currentPassword.equals(oldPassword)) {
            clearPass();
            writePassword(oldPassword);
            return 1;
        } else {
            return 0;
        }
    }

}

