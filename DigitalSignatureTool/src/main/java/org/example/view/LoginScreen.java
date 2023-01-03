/*
 * Created by JFormDesigner on Fri Dec 30 09:53:24 ICT 2022
 */

package org.example.view;

import javax.swing.*;
import javax.swing.GroupLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;

/**
 * @author unknown
 */
public class LoginScreen {

    private boolean isLogin;

    public LoginScreen() {
        initComponents();
    }

    public void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        loginPanel = new JPanel();
        loginPINLabel = new JLabel();
        loginButton = new JButton();
        loginPasswordField = new JPasswordField();

        //======== loginPanel ========
        {

            //---- loginPINLabel ----
            loginPINLabel.setText("Nh\u1eadp m\u00e3 PIN:");

            //---- loginButton ----
            loginButton.setText("\u0110\u0103ng nh\u1eadp");

            GroupLayout loginPanelLayout = new GroupLayout(loginPanel);
            loginPanel.setLayout(loginPanelLayout);
            loginPanelLayout.setHorizontalGroup(
                loginPanelLayout.createParallelGroup()
                    .addGroup(loginPanelLayout.createSequentialGroup()
                        .addGap(52, 52, 52)
                        .addComponent(loginPINLabel)
                        .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(loginPasswordField, GroupLayout.PREFERRED_SIZE, 202, GroupLayout.PREFERRED_SIZE)
                        .addGap(29, 29, 29)
                        .addComponent(loginButton, GroupLayout.PREFERRED_SIZE, 106, GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(135, Short.MAX_VALUE))
            );
            loginPanelLayout.setVerticalGroup(
                loginPanelLayout.createParallelGroup()
                    .addGroup(loginPanelLayout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addGroup(loginPanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(loginPINLabel)
                            .addComponent(loginPasswordField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                            .addComponent(loginButton))
                        .addContainerGap(84, Short.MAX_VALUE))
            );
        }
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on

        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String username, password;

                password = loginPasswordField.getPassword().toString();
                try {
                    isLogin = LoginControl.isLoginSuccessfully(password);
                    if (isLogin == false) {
                        JOptionPane.showMessageDialog(loginPanel, "Mật khẩu sai, vui lòng nhập lại mật khẩu");
                    }
                } catch (FileNotFoundException ex) {
                    JOptionPane.showMessageDialog(loginPanel,"Không thể đọc password, vui lòng kiểm tra lại");
                }


            }
        });
    }

    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JPanel loginPanel;
    private JLabel loginPINLabel;
    private JButton loginButton;
    private JPasswordField loginPasswordField;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
    private JOptionPane message;
    public JPanel getLoginPanel() {
        return loginPanel;
    }

    public boolean getLoginStatus() {
        return isLogin;
    }
}
