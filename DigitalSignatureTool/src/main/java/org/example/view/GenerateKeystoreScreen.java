/*
 * Created by JFormDesigner on Mon Jan 02 12:25:31 ICT 2023
 */

package org.example.view;

import javax.swing.*;
import javax.swing.GroupLayout;

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
            createCertificate.setText("T\u1ea1o Certificate");

            GroupLayout panel1Layout = new GroupLayout(panel1);
            panel1.setLayout(panel1Layout);
            panel1Layout.setHorizontalGroup(
                panel1Layout.createParallelGroup()
                    .addGroup(panel1Layout.createSequentialGroup()
                        .addGap(26, 26, 26)
                        .addGroup(panel1Layout.createParallelGroup()
                            .addComponent(createCertificate)
                            .addGroup(panel1Layout.createSequentialGroup()
                                .addGroup(panel1Layout.createParallelGroup()
                                    .addGroup(panel1Layout.createSequentialGroup()
                                        .addComponent(label5)
                                        .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(label6))
                                    .addComponent(label3)
                                    .addComponent(label4)
                                    .addComponent(OrgLabel)
                                    .addComponent(fullNameLabel))
                                .addGap(18, 18, 18)
                                .addGroup(panel1Layout.createParallelGroup()
                                    .addComponent(FullNameTextField, GroupLayout.PREFERRED_SIZE, 303, GroupLayout.PREFERRED_SIZE)
                                    .addComponent(OrgTextField, GroupLayout.PREFERRED_SIZE, 303, GroupLayout.PREFERRED_SIZE)
                                    .addComponent(CityTextField, GroupLayout.PREFERRED_SIZE, 303, GroupLayout.PREFERRED_SIZE)
                                    .addComponent(CountryCodeTextField, GroupLayout.PREFERRED_SIZE, 303, GroupLayout.PREFERRED_SIZE)
                                    .addComponent(WardTextField, GroupLayout.PREFERRED_SIZE, 303, GroupLayout.PREFERRED_SIZE))))
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
                        .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 43, Short.MAX_VALUE)
                        .addComponent(createCertificate)
                        .addGap(27, 27, 27))
            );
        }
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
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
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
