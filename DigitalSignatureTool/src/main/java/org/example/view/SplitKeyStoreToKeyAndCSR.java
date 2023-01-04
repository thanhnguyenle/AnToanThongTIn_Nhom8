/*
 * Created by JFormDesigner on Wed Jan 04 07:32:04 ICT 2023
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
 * @author howl
 */
public class SplitKeyStoreToKeyAndCSR extends JPanel {
    private String keyStorePath, keyPath, csrPath;
    public SplitKeyStoreToKeyAndCSR() {
        initComponents();
    }

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        panel1 = new JPanel();
        label1 = new JLabel();
        selectKeystoreFileButton = new JButton();
        fileLinkLabel = new JLabel();
        label4 = new JLabel();
        splitButton = new JButton();
        clearButton = new JButton();
        selectCSVDirectoryButton = new JButton();
        csrDirectoryLabel = new JLabel();

        //======== panel1 ========
        {

            //---- label1 ----
            label1.setText("Ch\u1ecdn File ch\u1eef k\u00fd c\u1ea7n t\u00e1ch");

            //---- selectKeystoreFileButton ----
            selectKeystoreFileButton.setText("Ch\u1ecdn file");

            //---- label4 ----
            label4.setText("V\u1ecb tr\u00ed l\u01b0u file CSV:");

            //---- splitButton ----
            splitButton.setText("T\u00e1ch File");

            //---- clearButton ----
            clearButton.setText("Xo\u00e1 th\u00f4ng tin");

            //---- selectCSVDirectoryButton ----
            selectCSVDirectoryButton.setText("Ch\u1ecdn \u0111\u01b0\u1eddng d\u1eabn");

            //---- csrDirectoryLabel ----
            csrDirectoryLabel.setText("");

            GroupLayout panel1Layout = new GroupLayout(panel1);
            panel1.setLayout(panel1Layout);
            panel1Layout.setHorizontalGroup(
                panel1Layout.createParallelGroup()
                    .addGroup(panel1Layout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.LEADING, false)
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addGap(3, 3, 3)
                                .addGroup(panel1Layout.createParallelGroup()
                                    .addComponent(clearButton, GroupLayout.PREFERRED_SIZE, 133, GroupLayout.PREFERRED_SIZE)
                                    .addGroup(panel1Layout.createSequentialGroup()
                                        .addComponent(label4)
                                        .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(selectCSVDirectoryButton))))
                            .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.TRAILING)
                                .addGroup(panel1Layout.createSequentialGroup()
                                    .addComponent(label1)
                                    .addGap(12, 12, 12)
                                    .addComponent(selectKeystoreFileButton, GroupLayout.PREFERRED_SIZE, 124, GroupLayout.PREFERRED_SIZE))
                                .addGroup(GroupLayout.Alignment.LEADING, panel1Layout.createSequentialGroup()
                                    .addGap(148, 148, 148)
                                    .addComponent(splitButton, GroupLayout.PREFERRED_SIZE, 124, GroupLayout.PREFERRED_SIZE))))
                        .addGroup(panel1Layout.createParallelGroup()
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 227, Short.MAX_VALUE)
                                .addComponent(fileLinkLabel, GroupLayout.PREFERRED_SIZE, 241, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap())
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addGap(17, 17, 17)
                                .addComponent(csrDirectoryLabel, GroupLayout.PREFERRED_SIZE, 223, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(234, Short.MAX_VALUE))))
            );
            panel1Layout.setVerticalGroup(
                panel1Layout.createParallelGroup()
                    .addGroup(panel1Layout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addGroup(panel1Layout.createParallelGroup()
                            .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                .addComponent(label1)
                                .addComponent(selectKeystoreFileButton))
                            .addComponent(fileLinkLabel, GroupLayout.PREFERRED_SIZE, 24, GroupLayout.PREFERRED_SIZE))
                        .addGap(37, 37, 37)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(label4)
                            .addComponent(selectCSVDirectoryButton)
                            .addComponent(csrDirectoryLabel))
                        .addGap(33, 33, 33)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(splitButton)
                            .addComponent(clearButton))
                        .addContainerGap(61, Short.MAX_VALUE))
            );
        }
        selectKeystoreFileButton.addActionListener(new ActionListener() {
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
                        return "File Chữ ký";
                    }
                });
                file.showOpenDialog(null);
                File selectedFile = file.getSelectedFile();
                keyStorePath = selectedFile.getAbsolutePath();
                fileLinkLabel.setText(keyStorePath);
            }
        });

        clearButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                keyPath = "";
                keyStorePath ="";
                csrPath ="";
                fileLinkLabel.setText("");
                csrDirectoryLabel.setText("");
            }
        });


        selectCSVDirectoryButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                csrPath = "";
                JFileChooser file = new JFileChooser();
                file.showSaveDialog(null);
                File saveFile = file.getSelectedFile();
                csrPath = saveFile.getAbsolutePath();
                if (!csrPath.endsWith(".csr")) {
                    csrPath +=".csr";
                }
                csrDirectoryLabel.setText(csrPath);
            }
        });

        splitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String inputPassword= "";
                JPanel panel = new JPanel();
                JLabel label = new JLabel("Enter a password:");
                JPasswordField pass = new JPasswordField(10);
                panel.add(label);
                panel.add(pass);
                String[] options = new String[]{"OK", "Cancel"};
                int option = JOptionPane.showOptionDialog(null, panel, "Nhập mật khẩu Keystore",
                        JOptionPane.NO_OPTION, JOptionPane.PLAIN_MESSAGE,
                        null, options, options[1]);
                if(option == 0) // pressing OK button
                {
                    char[] password = pass.getPassword();
                    for (int i = 0; i < password.length;i++) {
                        inputPassword += password[i];
                    }
                    System.out.println(inputPassword);
                }

                PDFDigitalSigning check = new PDFDigitalSigning();
                boolean checkExport = check.exportCertificate(keyStorePath, csrPath, inputPassword);

                if(checkExport == true) {
                    JOptionPane.showMessageDialog(getPanel(),"Thành công, vui lòng kiểm tra file Certificate trong đường dẫn đã nhập");

                } else
                    JOptionPane.showMessageDialog(getPanel(),"Tách thất bại, vui lòng kiểm tra lại mật khẩu Keystore!");
                JOptionPane.getRootFrame().dispose();
            }
        });
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }


    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JPanel panel1;
    private JLabel label1;
    private JButton selectKeystoreFileButton;
    private JLabel fileLinkLabel;
    private JLabel label4;
    private JButton splitButton;
    private JButton clearButton;
    private JButton selectCSVDirectoryButton;
    private JLabel csrDirectoryLabel;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on

    public JPanel getPanel() {
        return panel1;
    }
}
