/*
 * Created by JFormDesigner on Fri Dec 30 09:53:24 ICT 2022
 */

package org.example.view;

import javax.swing.*;
import javax.swing.GroupLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author unknown
 */
public class LoginScreen {
    public LoginScreen() {
        initComponents();
    }

    private boolean isLogin;
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
                        .addGap(30, 30, 30)
                        .addComponent(loginButton, GroupLayout.PREFERRED_SIZE, 106, GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(134, Short.MAX_VALUE))
            );
            loginPanelLayout.setVerticalGroup(
                loginPanelLayout.createParallelGroup()
                    .addGroup(loginPanelLayout.createSequentialGroup()
                        .addGroup(loginPanelLayout.createParallelGroup()
                            .addGroup(loginPanelLayout.createSequentialGroup()
                                .addGap(26, 26, 26)
                                .addGroup(loginPanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                    .addComponent(loginPINLabel)
                                    .addComponent(loginPasswordField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)))
                            .addGroup(loginPanelLayout.createSequentialGroup()
                                .addGap(34, 34, 34)
                                .addComponent(loginButton)))
                        .addContainerGap(76, Short.MAX_VALUE))
            );
        }
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on

        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String username, password;

                password = loginPasswordField.getPassword().toString();

                if (password == "1") {
                    isLogin = true;
                    JOptionPane.showMessageDialog(loginPanel,"Đăng nhập thành công");

                } else {
                    isLogin = false;
                    JOptionPane.showMessageDialog(loginPanel,"Vui lòng kiểm tra tài khoản và mật khẩu","Đăng nhập thất bại",JOptionPane.ERROR_MESSAGE);
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
}
