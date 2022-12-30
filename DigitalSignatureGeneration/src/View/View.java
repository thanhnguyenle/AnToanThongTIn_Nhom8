package View;

import java.awt.*;
import javax.swing.*;
/*
 * Created by JFormDesigner on Fri Dec 30 09:57:07 ICT 2022
 */



/**
 * @author unknown
 */
public class View  {

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        mainFrame = new Frame();
        menuPanel = new JPanel();
        mainMenuBar = new JMenuBar();
        settingJMenu = new JMenu();
        changeNameMenuItem = new JMenuItem();
        changePINMenuItem = new JMenuItem();
        digitalSignaltureMenu = new JMenu();
        digitalSignaturePDFMenuItem = new JMenuItem();
        aboutMenu = new JMenu();
        mainPanel = new JPanel();

        //======== mainFrame ========
        {
            mainFrame.setTitle("Ph\u1ea7n m\u1ec1m k\u00fd s\u1ed1");
            mainFrame.setIconImage(new ImageIcon(getClass().getResource("/icon.gif")).getImage());
            mainFrame.setLayout(new BorderLayout());

            //======== menuPanel ========
            {
                menuPanel.setLayout(new BorderLayout());

                //======== mainMenuBar ========
                {

                    //======== settingJMenu ========
                    {
                        settingJMenu.setText("C\u1ea5u h\u00ecnh");

                        //---- changeNameMenuItem ----
                        changeNameMenuItem.setText("\u0110\u1ed5i t\u00ean Token");
                        settingJMenu.add(changeNameMenuItem);

                        //---- changePINMenuItem ----
                        changePINMenuItem.setText("Thay \u0111\u1ed5i Pin");
                        settingJMenu.add(changePINMenuItem);
                    }
                    mainMenuBar.add(settingJMenu);

                    //======== digitalSignaltureMenu ========
                    {
                        digitalSignaltureMenu.setText("Ch\u1ee9ng th\u01b0 s\u1ed1");

                        //---- digitalSignaturePDFMenuItem ----
                        digitalSignaturePDFMenuItem.setText("Ch\u1eef k\u00fd \u0111i\u1ec7n t\u1eed PDF");
                        digitalSignaltureMenu.add(digitalSignaturePDFMenuItem);
                    }
                    mainMenuBar.add(digitalSignaltureMenu);

                    //======== aboutMenu ========
                    {
                        aboutMenu.setText("Gi\u1edbi thi\u1ec7u");
                    }
                    mainMenuBar.add(aboutMenu);
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
            mainFrame.setLocationRelativeTo(mainFrame.getOwner());
        }
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }

    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private Frame mainFrame;

    private JPanel menuPanel;
    private JMenuBar mainMenuBar;
    private JMenu settingJMenu;
    private JMenuItem changeNameMenuItem;


    private JMenuItem changePINMenuItem;
    private JMenu digitalSignaltureMenu;
    private JMenuItem digitalSignaturePDFMenuItem;
    private JMenu aboutMenu;
    private JPanel mainPanel;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on

    public static void main(String[] args) {
        View view  = new View();
        view.initComponents();

    }
}
