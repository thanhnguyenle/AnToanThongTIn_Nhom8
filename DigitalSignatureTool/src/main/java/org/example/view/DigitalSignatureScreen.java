/*
 * Created by JFormDesigner on Fri Dec 30 11:03:25 ICT 2022
 */

package org.example.view;

import javax.swing.*;
import javax.swing.GroupLayout;

/**
 * @author unknown
 */
public class DigitalSignatureScreen extends JPanel {
    public DigitalSignatureScreen() {
        initComponents();
    }

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        DigitalSignaturePanel = new JPanel();
        chooseFileLabel = new JLabel();
        chooseFileButton = new JButton();
        statusLabel = new JLabel();

        //======== DigitalSignaturePanel ========
        {

            //---- chooseFileLabel ----
            chooseFileLabel.setText("L\u1ea5y file ch\u1eef k\u00fd");

            //---- chooseFileButton ----
            chooseFileButton.setText("Ch\u1ecdn file");

            //---- statusLabel ----
            statusLabel.setText("Tr\u1ea1ng th\u00e1i");

            GroupLayout DigitalSignaturePanelLayout = new GroupLayout(DigitalSignaturePanel);
            DigitalSignaturePanel.setLayout(DigitalSignaturePanelLayout);
            DigitalSignaturePanelLayout.setHorizontalGroup(
                DigitalSignaturePanelLayout.createParallelGroup()
                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addComponent(chooseFileLabel)
                        .addGap(18, 18, 18)
                        .addComponent(chooseFileButton)
                        .addGap(28, 28, 28)
                        .addComponent(statusLabel)
                        .addContainerGap(381, Short.MAX_VALUE))
            );
            DigitalSignaturePanelLayout.setVerticalGroup(
                DigitalSignaturePanelLayout.createParallelGroup()
                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addGroup(DigitalSignaturePanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(chooseFileLabel)
                            .addComponent(chooseFileButton)
                            .addComponent(statusLabel))
                        .addContainerGap(282, Short.MAX_VALUE))
            );
        }
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }

    public JPanel getPanel() {
        return DigitalSignaturePanel;
    }
    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JPanel DigitalSignaturePanel;
    private JLabel chooseFileLabel;
    private JButton chooseFileButton;
    private JLabel statusLabel;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
