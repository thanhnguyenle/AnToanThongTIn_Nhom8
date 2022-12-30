/*
 * Created by JFormDesigner on Fri Dec 30 09:58:23 ICT 2022
 */

package View;

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
        oldPINLabel = new JLabel();
        oldPINTextField = new JTextField();
        newPINLabel = new JLabel();
        newPINTextField = new JTextField();
        retypeNewPINLabel = new JLabel();
        retypeNewPINTextField = new JTextField();
        applyNewPINButton = new JButton();

        //======== this ========

        //---- oldPINLabel ----
        oldPINLabel.setText("Nh\u1eadp PIN c\u0169:");

        //---- newPINLabel ----
        newPINLabel.setText("Nh\u1eadp PIN m\u1edbi");

        //---- retypeNewPINLabel ----
        retypeNewPINLabel.setText("Nh\u1eadp l\u1ea1i PIN m\u1edbi");

        //---- applyNewPINButton ----
        applyNewPINButton.setText("\u00c1p d\u1ee5ng");

        GroupLayout layout = new GroupLayout(this);
        setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup()
                .addGroup(layout.createSequentialGroup()
                    .addGroup(layout.createParallelGroup()
                        .addGroup(layout.createSequentialGroup()
                            .addGap(23, 23, 23)
                            .addGroup(layout.createParallelGroup(GroupLayout.Alignment.TRAILING)
                                .addGroup(layout.createSequentialGroup()
                                    .addComponent(retypeNewPINLabel)
                                    .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                    .addComponent(retypeNewPINTextField, GroupLayout.PREFERRED_SIZE, 200, GroupLayout.PREFERRED_SIZE))
                                .addGroup(layout.createSequentialGroup()
                                    .addGroup(layout.createParallelGroup()
                                        .addComponent(oldPINLabel)
                                        .addComponent(newPINLabel))
                                    .addGap(28, 28, 28)
                                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING, false)
                                        .addComponent(oldPINTextField, GroupLayout.DEFAULT_SIZE, 199, Short.MAX_VALUE)
                                        .addComponent(newPINTextField, GroupLayout.DEFAULT_SIZE, 199, Short.MAX_VALUE)))))
                        .addGroup(layout.createSequentialGroup()
                            .addGap(148, 148, 148)
                            .addComponent(applyNewPINButton)))
                    .addContainerGap(75, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup()
                .addGroup(layout.createSequentialGroup()
                    .addGap(43, 43, 43)
                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                        .addComponent(oldPINLabel)
                        .addComponent(oldPINTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                    .addGap(26, 26, 26)
                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                        .addComponent(newPINLabel)
                        .addComponent(newPINTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                    .addGap(36, 36, 36)
                    .addGroup(layout.createParallelGroup()
                        .addComponent(retypeNewPINLabel)
                        .addComponent(retypeNewPINTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                    .addGap(34, 34, 34)
                    .addComponent(applyNewPINButton)
                    .addContainerGap(41, Short.MAX_VALUE))
        );
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }

    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    public JLabel oldPINLabel;
    public JTextField oldPINTextField;
    public JLabel newPINLabel;
    public JTextField newPINTextField;
    public JLabel retypeNewPINLabel;
    public JTextField retypeNewPINTextField;
    public JButton applyNewPINButton;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
