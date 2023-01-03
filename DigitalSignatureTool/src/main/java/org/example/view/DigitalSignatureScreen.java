/*
 * Created by JFormDesigner on Fri Dec 30 11:03:25 ICT 2022
 */

package org.example.view;

import org.example.controller.PDFDigitalSigning;

import javax.swing.*;
import javax.swing.GroupLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;

import static org.example.view.LoginControl.getPassword;

/**
 * @author unknown
 */
public class DigitalSignatureScreen extends JPanel {

    public String billPath;
    public String keyStorePath;
    public boolean isCheck = false;
    

    public DigitalSignatureScreen() {
        initComponents();
    }

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        DigitalSignaturePanel = new JPanel();
        chooseFileLabel = new JLabel();
        chooseFileButton = new JButton();
        FileSignedPathLabel = new JLabel();
        signButton = new JButton();
        chooseSignatureLabel = new JLabel();
        chooseKeyStoreButton = new JButton();
        keyStorePathLabel = new JLabel();
        removeInfoButton = new JButton();

        //======== DigitalSignaturePanel ========
        {

            //---- chooseFileLabel ----
            chooseFileLabel.setText("L\u1ea5y File c\u1ea7n k\u00fd");

            //---- chooseFileButton ----
            chooseFileButton.setText("Ch\u1ecdn file");

            //---- FileSignedPathLabel ----
            FileSignedPathLabel.setText("\u0110\u01b0\u1eddng d\u1eabn:");

            //---- signButton ----
            signButton.setText("K\u00fd");

            //---- chooseSignatureLabel ----
            chooseSignatureLabel.setText("Ch\u1ecdn ch\u1eef k\u00fd");

            //---- chooseKeyStoreButton ----
            chooseKeyStoreButton.setText("Ch\u1ecdn file");

            //---- keyStorePathLabel ----
            keyStorePathLabel.setText("\u0110\u01b0\u1eddng d\u1eabn");

            //---- removeInfoButton ----
            removeInfoButton.setText("Xo\u00e1 to\u00e0n b\u1ed9 th\u00f4ng tin");

            GroupLayout DigitalSignaturePanelLayout = new GroupLayout(DigitalSignaturePanel);
            DigitalSignaturePanel.setLayout(DigitalSignaturePanelLayout);
            DigitalSignaturePanelLayout.setHorizontalGroup(
                DigitalSignaturePanelLayout.createParallelGroup()
                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(DigitalSignaturePanelLayout.createParallelGroup()
                            .addComponent(signButton)
                            .addComponent(removeInfoButton)
                            .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                                .addGroup(DigitalSignaturePanelLayout.createParallelGroup()
                                    .addComponent(chooseFileLabel)
                                    .addComponent(chooseSignatureLabel))
                                .addGap(18, 18, 18)
                                .addGroup(DigitalSignaturePanelLayout.createParallelGroup()
                                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                                        .addComponent(chooseKeyStoreButton)
                                        .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(keyStorePathLabel))
                                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                                        .addComponent(chooseFileButton)
                                        .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(FileSignedPathLabel)))))
                        .addContainerGap(387, Short.MAX_VALUE))
            );
            DigitalSignaturePanelLayout.setVerticalGroup(
                DigitalSignaturePanelLayout.createParallelGroup()
                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addGroup(DigitalSignaturePanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(chooseFileLabel)
                            .addComponent(chooseFileButton)
                            .addComponent(FileSignedPathLabel))
                        .addGap(18, 18, 18)
                        .addGroup(DigitalSignaturePanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(chooseSignatureLabel)
                            .addComponent(chooseKeyStoreButton)
                            .addComponent(keyStorePathLabel))
                        .addGap(18, 18, 18)
                        .addComponent(removeInfoButton)
                        .addGap(26, 26, 26)
                        .addComponent(signButton)
                        .addContainerGap(130, Short.MAX_VALUE))
            );
        }
        chooseFileButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                billPath = "";
                JFileChooser file = new JFileChooser();
                file.showOpenDialog(null);
                File selectedFile = file.getSelectedFile();
                billPath = selectedFile.getAbsolutePath();
                FileSignedPathLabel.setText(billPath);
            }
        });
        chooseKeyStoreButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                keyStorePath = "";
                JFileChooser file = new JFileChooser();
                file.showOpenDialog(null);
                File selectedFile = file.getSelectedFile();
                keyStorePath = selectedFile.getAbsolutePath();
                keyStorePathLabel.setText(keyStorePath);
            }
        });
        removeInfoButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                billPath = "";
                keyStorePath = "";
                isCheck = false;
                keyStorePathLabel.setText("");
                FileSignedPathLabel.setText("");
            }
        });
        signButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                while(isCheck == false) {
                    String password = "";
                    String inputPassword = JOptionPane.showInputDialog(null,"Nhập mật khẩu");
                    try {
                        password = getPassword();
                        if(inputPassword.equals(password)) {
                            isCheck = true;
                            PDFDigitalSigning.signBill(billPath,inputPassword,keyStorePath);
                            JOptionPane.showMessageDialog(getPanel(),"Ký thành công, vui lòng kiểm tra file đã ký trong thư mục chứa file gốc");

                        } else {
                            JOptionPane.showMessageDialog(null,"Đăng nhập thất bại, vui lòng kiểm tra lại mật khẩu!");
                        }
                    } catch (FileNotFoundException ex) {
                        JOptionPane.showMessageDialog(null,"Đăng nhập thất bại, vui lòng kiểm tra lại mật khẩu!");
                    }
                }
            }
        });
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }

    public JPanel getPanel() {
        return DigitalSignaturePanel;
    }
    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JPanel DigitalSignaturePanel;
    private JLabel chooseFileLabel;
    private JButton chooseFileButton;
    private JLabel FileSignedPathLabel;
    private JButton signButton;
    private JLabel chooseSignatureLabel;
    private JButton chooseKeyStoreButton;
    private JLabel keyStorePathLabel;
    private JButton removeInfoButton;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
