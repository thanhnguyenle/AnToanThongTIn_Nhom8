/*
 * Created by JFormDesigner on Fri Dec 30 09:53:24 ICT 2022
 */

package View;

import javax.swing.*;
import javax.swing.GroupLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author unknown
 */
public class LoginScreen extends JPanel {
    public LoginScreen() {
        initComponents();
    }

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        loginPINLabel = new JLabel();
        loginButton = new JButton();
        loginUsernameLabel = new JLabel();
        loginUsernameTextField = new JTextField();
        loginPasswordField = new JPasswordField();

        //======== this ========

        //---- loginPINLabel ----
        loginPINLabel.setText("Nh\u1eadp m\u00e3 PIN:");

        //---- loginButton ----
        loginButton.setText("\u0110\u0103ng nh\u1eadp");

        //---- loginUsernameLabel ----
        loginUsernameLabel.setText("T\u00ean \u0111\u0103ng nh\u1eadp");

        GroupLayout layout = new GroupLayout(this);
        setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup()
                .addGroup(layout.createSequentialGroup()
                    .addGap(56, 56, 56)
                    .addGroup(layout.createParallelGroup()
                        .addGroup(GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                            .addComponent(loginUsernameLabel)
                            .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED))
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(loginPINLabel)
                            .addGap(11, 11, 11)))
                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.TRAILING, false)
                        .addComponent(loginPasswordField, GroupLayout.DEFAULT_SIZE, 202, Short.MAX_VALUE)
                        .addComponent(loginUsernameTextField, GroupLayout.DEFAULT_SIZE, 202, Short.MAX_VALUE))
                    .addGap(29, 29, 29)
                    .addComponent(loginButton, GroupLayout.PREFERRED_SIZE, 106, GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(132, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup()
                .addGroup(layout.createSequentialGroup()
                    .addGap(17, 17, 17)
                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                        .addComponent(loginUsernameLabel)
                        .addComponent(loginUsernameTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                    .addGap(18, 18, 18)
                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                        .addComponent(loginPINLabel)
                        .addComponent(loginButton)
                        .addComponent(loginPasswordField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                    .addContainerGap(43, Short.MAX_VALUE))
        );
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on

        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String username, password;

                username = loginUsernameTextField.getText();
                password = loginPasswordField.getPassword().toString();



            }
        });
    }

    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JLabel loginPINLabel;
    private JButton loginButton;
    private JLabel loginUsernameLabel;
    private JTextField loginUsernameTextField;
    private JPasswordField loginPasswordField;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on

}
