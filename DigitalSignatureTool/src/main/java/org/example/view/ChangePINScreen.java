/*
 * Created by JFormDesigner on Fri Dec 30 09:58:23 ICT 2022
 */

package org.example.view;

import javax.swing.*;
import javax.swing.GroupLayout;

/**
 * @author unknown
 */
public class ChangePINScreen extends JPanel {
    public ChangePINScreen() {
        initComponents();
    }

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        panel1 = new JPanel();
        oldPINLabel = new JLabel();
        oldPINTextField = new JTextField();
        newPINLabel = new JLabel();
        newPINTextField = new JTextField();
        retypeNewPINLabel = new JLabel();
        retypeNewPINTextField = new JTextField();
        applyNewPINButton = new JButton();

        //======== panel1 ========
        {

            //---- oldPINLabel ----
            oldPINLabel.setText("Nh\u1eadp PIN c\u0169:");

            //---- newPINLabel ----
            newPINLabel.setText("Nh\u1eadp PIN m\u1edbi");

            //---- retypeNewPINLabel ----
            retypeNewPINLabel.setText("Nh\u1eadp l\u1ea1i PIN m\u1edbi");

            //---- applyNewPINButton ----
            applyNewPINButton.setText("\u00c1p d\u1ee5ng");

            GroupLayout panel1Layout = new GroupLayout(panel1);
            panel1.setLayout(panel1Layout);
            panel1Layout.setHorizontalGroup(
                panel1Layout.createParallelGroup()
                    .addGroup(panel1Layout.createSequentialGroup()
                        .addGap(32, 32, 32)
                        .addGroup(panel1Layout.createParallelGroup()
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addComponent(newPINLabel)
                                .addGap(18, 18, 18)
                                .addComponent(newPINTextField, GroupLayout.PREFERRED_SIZE, 199, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(201, Short.MAX_VALUE))
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addComponent(oldPINLabel)
                                .addGap(18, 18, 18)
                                .addComponent(oldPINTextField, GroupLayout.DEFAULT_SIZE, 199, Short.MAX_VALUE)
                                .addGap(206, 206, 206))
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addGroup(panel1Layout.createParallelGroup()
                                    .addComponent(applyNewPINButton)
                                    .addGroup(panel1Layout.createSequentialGroup()
                                        .addComponent(retypeNewPINLabel)
                                        .addGap(18, 18, 18)
                                        .addComponent(retypeNewPINTextField, GroupLayout.PREFERRED_SIZE, 200, GroupLayout.PREFERRED_SIZE)))
                                .addGap(0, 185, Short.MAX_VALUE))))
            );
            panel1Layout.setVerticalGroup(
                panel1Layout.createParallelGroup()
                    .addGroup(panel1Layout.createSequentialGroup()
                        .addGap(30, 30, 30)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(oldPINLabel)
                            .addComponent(oldPINTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                        .addGap(24, 24, 24)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(newPINLabel)
                            .addComponent(newPINTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                        .addGap(25, 25, 25)
                        .addGroup(panel1Layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(retypeNewPINLabel)
                            .addComponent(retypeNewPINTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(applyNewPINButton)
                        .addContainerGap(78, Short.MAX_VALUE))
            );
        }
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }

    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JPanel panel1;
    private JLabel oldPINLabel;
    private JTextField oldPINTextField;
    private JLabel newPINLabel;
    private JTextField newPINTextField;
    private JLabel retypeNewPINLabel;
    private JTextField retypeNewPINTextField;
    private JButton applyNewPINButton;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
    public JPanel getPanel() {
        return panel1;
    }
}

