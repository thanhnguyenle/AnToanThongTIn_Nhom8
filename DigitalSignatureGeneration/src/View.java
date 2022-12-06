import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;

public class View extends JFrame {


    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        mainFrame = new Frame();
        menuPanel = new JPanel();
        mainMenuBar = new JMenuBar();
        settingJMenu = new JMenu();
        changeNameMenuItem = new JMenuItem();
        changePINMenuItem = new JMenuItem();
        viewInfoMenuItem = new JMenuItem();
        digitalSignaltureMenu = new JMenu();
        aboutMenu = new JMenu();

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

                        //---- viewInfoMenuItem ----
                        viewInfoMenuItem.setText("Th\u00f4ng tin kh\u00e1ch h\u00e0ng");
                        settingJMenu.add(viewInfoMenuItem);
                    }
                    mainMenuBar.add(settingJMenu);

                    //======== digitalSignaltureMenu ========
                    {
                        digitalSignaltureMenu.setText("Ch\u1ee9ng th\u01b0 s\u1ed1");
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
    private JMenuItem viewInfoMenuItem;
    private JMenu digitalSignaltureMenu;
    private JMenu aboutMenu;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
