package org.example.view;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;
import javax.swing.JFrame;
/*
 * Created by JFormDesigner on Fri Dec 30 09:57:07 ICT 2022
 */



/**
 * @author unknown
 */
public class View  {

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        JFrame mainFrame = new JFrame();
        menuPanel = new JPanel();
        mainMenuBar = new JMenuBar();
        settingJMenu = new JMenu();
        changeNameMenuItem = new JMenuItem();
        changePINMenuItem = new JMenuItem();
        digitalSignatureMenu = new JMenu();
        digitalSignaturePDFMenuItem = new JMenuItem();
//        aboutMenu = new JMenu();
        splitKeystoreFileMenu = new JMenuItem();
        mainPanel = new JPanel();
        createKeyStoreMenuItem = new JMenuItem();
        verifyFile = new JMenuItem();

        //======== mainFrame ========

        {
            mainFrame.setTitle("Ph\u1ea7n m\u1ec1m k\u00fd s\u1ed1");
            mainFrame.setLayout(new BorderLayout());

            //======== menuPanel ========
            {
                menuPanel.setLayout(new BorderLayout());

                //======== mainMenuBar ========
                {

                    //======== digitalSignaltureMenu ========
                    {
                        digitalSignatureMenu.setText("Ch\u1ee9ng th\u01b0 s\u1ed1");

                        //---- digitalSignaturePDFMenuItem ----
                        digitalSignaturePDFMenuItem.setText("Ch\u1eef k\u00fd \u0111i\u1ec7n t\u1eed PDF");
                        digitalSignatureMenu.add(digitalSignaturePDFMenuItem);
                        digitalSignaturePDFMenuItem.addActionListener(new ActionListener() {
                            @Override
                            public void actionPerformed(ActionEvent e) {
                                mainPanel.removeAll();
                                DigitalSignatureScreen digitalSignatureScreen = new DigitalSignatureScreen();
                                addScreen(digitalSignatureScreen.getPanel(), mainPanel);
                            }
                        });

//                        ======== Create Keystore ===

                        createKeyStoreMenuItem.setText("Tạo chữ ký");
                        digitalSignatureMenu.add(createKeyStoreMenuItem);
                        createKeyStoreMenuItem.addActionListener(new ActionListener() {
                            @Override
                            public void actionPerformed(ActionEvent e) {
                                mainPanel.removeAll();
                                GenerateKeystoreScreen generateKeystoreScreen = new GenerateKeystoreScreen();
                                addScreen(generateKeystoreScreen.getPanel(), mainPanel);
                            }
                        });

                        //
                        verifyFile.setText("Kiểm tra trạng thái chữ ký của file");
                        digitalSignatureMenu.add(verifyFile);
                        verifyFile.addActionListener(new ActionListener() {
                            @Override
                            public void actionPerformed(ActionEvent e) {
                                mainPanel.removeAll();
                                VerifyScreen verifyScreen = new VerifyScreen();
                                addScreen(verifyScreen.getPanel(),mainPanel);
                            }
                        });


                    }
                    mainMenuBar.add(digitalSignatureMenu);



//                    ======== aboutMenu ========
                    {
                        splitKeystoreFileMenu.setText("Tạo file Certificate từ file chữ ký");
                    }
                    digitalSignatureMenu.add(splitKeystoreFileMenu);
                    splitKeystoreFileMenu.addActionListener(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {
                            mainPanel.removeAll();
                            SplitKeyStoreToKeyAndCSR splitScreen = new SplitKeyStoreToKeyAndCSR();
                            addScreen(splitScreen.getPanel(),mainPanel);
                        }
                    });
                }
                menuPanel.add(mainMenuBar, BorderLayout.CENTER);
            }
            mainFrame.add(menuPanel, BorderLayout.NORTH);

            //======== mainPanel ========
            {
                mainPanel.setLayout(new BorderLayout());
            }
            mainFrame.add(mainPanel, BorderLayout.CENTER);
            mainFrame.pack();
            mainFrame.setLocationRelativeTo(null);
            mainFrame.setVisible(true);
            mainFrame.setSize(600,400);
            mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        }

        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }

    private void addScreen(JPanel panel, JPanel mainPanel) {
        mainPanel.add(panel);
    }

    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private Frame mainFrame;
    private JPanel menuPanel;
    private JMenuBar mainMenuBar;
    private JMenu settingJMenu;
    private JMenuItem changeNameMenuItem;
    private JMenuItem changePINMenuItem;
    private JMenu digitalSignatureMenu;
    private JMenuItem digitalSignaturePDFMenuItem;
    private JMenuItem createKeyStoreMenuItem;
    private JMenuItem verifyFile;
    private JMenuItem splitKeystoreFileMenu;
    private JPanel mainPanel;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on

    public static void main(String[] args) {
        View run = new View();
        run.initComponents();
    }
}
