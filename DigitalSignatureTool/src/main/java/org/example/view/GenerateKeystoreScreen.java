/*
 * Created by JFormDesigner on Mon Jan 02 12:25:31 ICT 2023
 */

package org.example.view;

import org.example.controller.PDFDigitalSigning;

import javax.swing.*;
import javax.swing.GroupLayout;
import javax.swing.filechooser.FileFilter;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;



/**
 * @author unknown
 */
public class GenerateKeystoreScreen extends JPanel {
    public GenerateKeystoreScreen() {
        initComponents();
    }

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        panel1 = new JPanel();
        fullNameLabel = new JLabel();
        OrgLabel = new JLabel();
        label3 = new JLabel();
        label4 = new JLabel();
        label5 = new JLabel();
        label6 = new JLabel();
        OrgTextField = new JTextField();
        CityTextField = new JTextField();
        FullNameTextField = new JTextField();
        WardTextField = new JTextField();
        CountryCodeTextField = new JTextField();
        createCertificate = new JButton();
        chooseDirectoryToSaveKeyStoreButton = new JButton();
        password = new JLabel();
        passwordField = new JPasswordField();
        directoryLabel = new JLabel();
        clearButton = new JButton();

        //======== panel1 ========
        {

            //---- fullNameLabel ----
            fullNameLabel.setText("T\u00ean \u0111\u1ea7y \u0111\u1ee7:");

            //---- OrgLabel ----
            OrgLabel.setText("\u0110\u01a1n v\u1ecb T\u1ed5 ch\u1ee9c:");

            //---- label3 ----
            label3.setText("Th\u00e0nh ph\u1ed1/T\u1ec9nh:");

            //---- label4 ----
            label4.setText("Qu\u1eadn/Huy\u1ec7n:");

            //---- label5 ----
            label5.setText("M\u00e3 v\u00f9ng:");

            //---- createCertificate ----
            createCertificate.setText("T\u1ea1o Ch\u1eef k\u00fd");

            //---- chooseDirectoryToSaveKeyStoreButton ----
            chooseDirectoryToSaveKeyStoreButton.setText("Ch\u1ecdn \u0111\u01b0\u1eddng d\u1eabn");

            //---- password ----
            password.setText("M\u1eadt kh\u1ea9u:");

            //---- clearButton ----
            clearButton.setText("Xo\u00e1 th\u00f4ng tin ");

            GroupLayout panel1Layout = new GroupLayout(panel1);
            panel1.setLayout(panel1Layout);
            panel1Layout.setHorizontalGroup(
                panel1Layout.createParallelGroup()
                    .addGroup(panel1Layout.createSequentialGroup()
                        .addGap(26, 26, 26)
                        .addGroup(panel1Layout.createParallelGroup()
                            .addComponent(createCertificate, GroupLayout.PREFERRED_SIZE, 101, GroupLayout.PREFERRED_SIZE)
                            .addComponent(chooseDirectoryToSaveKeyStoreButton)
                            .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING, false)
                                .addGroup(panel1Layout.createSequentialGroup()
                                    .addComponent(clearButton)
                                    .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(directoryLabel, GroupLayout.DEFAULT_SIZE, 293, Short.MAX_VALUE))
                                .addGroup(panel1Layout.createSequentialGroup()
                                    .addGroup(panel1Layout.createParallelGroup()
                                        .addGroup(panel1Layout.createSequentialGroup()
                                            .addComponent(label5)
                                            .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                                            .addComponent(label6))
                                        .addComponent(label3)
                                        .addComponent(label4)
                                        .addComponent(OrgLabel)
                                        .addComponent(fullNameLabel)
                                        .addComponent(password))
                                    .addGap(18, 18, 18)
                                    .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING, false)
                                        .addComponent(FullNameTextField, GroupLayout.DEFAULT_SIZE, 303, Short.MAX_VALUE)
                                        .addComponent(OrgTextField, GroupLayout.DEFAULT_SIZE, 303, Short.MAX_VALUE)
                                        .addComponent(CityTextField, GroupLayout.DEFAULT_SIZE, 303, Short.MAX_VALUE)
                                        .addComponent(CountryCodeTextField, GroupLayout.DEFAULT_SIZE, 303, Short.MAX_VALUE)
                                        .addComponent(WardTextField, GroupLayout.DEFAULT_SIZE, 303, Short.MAX_VALUE)
                                        .addComponent(passwordField, GroupLayout.DEFAULT_SIZE, 303, Short.MAX_VALUE)))))
                        .addContainerGap(300, Short.MAX_VALUE))
            );
            panel1Layout.setVerticalGroup(
                panel1Layout.createParallelGroup()
                    .addGroup(panel1Layout.createSequentialGroup()
                        .addGap(26, 26, 26)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(fullNameLabel)
                            .addComponent(FullNameTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(OrgLabel)
                            .addComponent(OrgTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(label3)
                            .addComponent(CityTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                        .addGap(10, 10, 10)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(WardTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                            .addComponent(label4))
                        .addGap(18, 18, 18)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.TRAILING)
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addComponent(label6)
                                .addGap(22, 22, 22))
                            .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                .addComponent(CountryCodeTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                .addComponent(label5)))
                        .addGap(26, 26, 26)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(password)
                            .addComponent(passwordField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                        .addGap(23, 23, 23)
                        .addGroup(panel1Layout.createParallelGroup()
                            .addComponent(directoryLabel)
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addComponent(clearButton)
                                .addGap(28, 28, 28)
                                .addComponent(chooseDirectoryToSaveKeyStoreButton)))
                        .addGap(18, 18, 18)
                        .addComponent(createCertificate)
                        .addContainerGap(30, Short.MAX_VALUE))
            );
        }
        chooseDirectoryToSaveKeyStoreButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                keyStorePath = "";
                JFileChooser file = new JFileChooser();
                file.addChoosableFileFilter(new FileFilter() {
                    @Override
                    public boolean accept(File f) {
                        return f.getName().toLowerCase().endsWith(".jks");
                    }

                    @Override
                    public String getDescription() {
                        return "Chữ ký";
                    }
                });
                file.setDialogType(JFileChooser.SAVE_DIALOG);
                file.showSaveDialog(null);
                keyStorePath = file.getSelectedFile().toString() ;
                System.out.println(keyStorePath);
                if (!keyStorePath.endsWith(".jks")) {
                    keyStorePath+=".jks";
                }
                directoryLabel.setText(keyStorePath);
                System.out.println(keyStorePath);

            }
        });
        createCertificate.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                String fullName = FullNameTextField.getText();
                String org = OrgTextField.getText();
                String city = CityTextField.getText();
                String ward = WardTextField.getText();
                String countryCode = CountryCodeTextField.getText();
                String password = getPassword();
                if (fullName.equals("") == false) {
                    if(org.equals("") == false) {
                        if(city.equals("") == false) {
                            if(ward.equals("") == false) {
                                if(countryCode.equals("") == false) {
                                    if(password.equals("") == false && password.length() >= 6) {
                                        PDFDigitalSigning sign = new PDFDigitalSigning();
                                        sign.createKeyStoreFile(password, keyStorePath);
                                        sign.loadEntriesToKeyStoreFile(keyStorePath,password,fullName,org,org,city,ward,countryCode);
                                        JOptionPane.showMessageDialog(panel1,"Tạo thành công, vui lòng kiểm tra file tại đường dẫn bên trên");
                                    } else JOptionPane.showMessageDialog(panel1,"Chiều dài password từ 6 ký tự trở lên, vui lòng nhập lại","Thiếu",JOptionPane.ERROR_MESSAGE);
                                } else JOptionPane.showMessageDialog(panel1,"Vui lòng nhập mã vùng!","Thiếu",JOptionPane.ERROR_MESSAGE);
                            }else JOptionPane.showMessageDialog(panel1,"Vui lòng nhập Huyện/Thành phố/Thị xã!","Thiếu",JOptionPane.ERROR_MESSAGE);
                        } else JOptionPane.showMessageDialog(panel1,"Vui lòng nhập Tỉnh/Thành phố!","Thiếu",JOptionPane.ERROR_MESSAGE);
                    } else JOptionPane.showMessageDialog(panel1,"Vui lòng nhập tên tổ chức","Thiếu",JOptionPane.ERROR_MESSAGE);
                } else JOptionPane.showMessageDialog(panel1,"Vui lòng nhập tên đầy đủ","Thiếu",JOptionPane.ERROR_MESSAGE);
            }
        });

        clearButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                FullNameTextField.setText("");
                OrgTextField.setText("");
                CityTextField.setText("");
                WardTextField.setText("");
                CountryCodeTextField.setText("");
                passwordField.setText("");
                keyStorePath = "";
                directoryLabel.setText("");
            }
        });
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }
    public JPanel getPanel() {
        return panel1;
    }
    public String keyStorePath = "";
    public String getPassword() {
        char[] pass = passwordField.getPassword();
        String result = "";
        for(int i = 0; i < pass.length; i++) {
            result += pass[i];
        }
        return result;
    }
    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JPanel panel1;
    private JLabel fullNameLabel;
    private JLabel OrgLabel;
    private JLabel label3;
    private JLabel label4;
    private JLabel label5;
    private JLabel label6;
    private JTextField OrgTextField;
    private JTextField CityTextField;
    private JTextField FullNameTextField;
    private JTextField WardTextField;
    private JTextField CountryCodeTextField;
    private JButton createCertificate;
    private JButton chooseDirectoryToSaveKeyStoreButton;
    private JLabel password;
    private JPasswordField passwordField;
    private JLabel directoryLabel;
    private JButton clearButton;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
