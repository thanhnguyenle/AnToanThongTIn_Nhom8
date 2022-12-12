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
        digitalSignaltureMenu = new JMenu();
        aboutMenu = new JMenu();
        LoginScreen = new JPanel();
        pinLabel = new JLabel();
        passwordField = new JPasswordField();
        loginButton = new JButton();
        ChangeTokenName = new JPanel();
        newUsernamePanel = new JPanel();
        newUsernameLabel = new JLabel();
        newUsernameTextField = new JTextField();
        requirePINLabel = new JLabel();
        requirePINTextField = new JTextField();
        requirePINButton = new JButton();

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
            mainFrame.add(menuPanel, BorderLayout.PAGE_START);

            //======== LoginScreen ========
            {
                LoginScreen.setPreferredSize(new Dimension(383, 20));
                LoginScreen.setLayout(new FlowLayout());

                //---- pinLabel ----
                pinLabel.setText("Nh\u1eadp m\u00e3 PIN");
                pinLabel.setAlignmentX(10.0F);
                pinLabel.setAlignmentY(20.0F);
                LoginScreen.add(pinLabel);

                //---- passwordField ----
                passwordField.setPreferredSize(new Dimension(200, 30));
                LoginScreen.add(passwordField);

                //---- loginButton ----
                loginButton.setText("\u0110\u0103ng nh\u1eadp");
                LoginScreen.add(loginButton);
            }
            mainFrame.add(LoginScreen, BorderLayout.PAGE_END);

            //======== ChangeTokenName ========
            {

                //======== newUsernamePanel ========
                {

                    //---- newUsernameLabel ----
                    newUsernameLabel.setText("Nh\u1eadp t\u00ean Token m\u1edbi:");

                    //---- requirePINLabel ----
                    requirePINLabel.setText("Nh\u1eadp PIN x\u00e1c nh\u1eadn:");

                    //---- requirePINButton ----
                    requirePINButton.setText("X\u00e1c nh\u1eadn");

                    GroupLayout newUsernamePanelLayout = new GroupLayout(newUsernamePanel);
                    newUsernamePanel.setLayout(newUsernamePanelLayout);
                    newUsernamePanelLayout.setHorizontalGroup(
                        newUsernamePanelLayout.createParallelGroup()
                            .addGroup(newUsernamePanelLayout.createSequentialGroup()
                                .addGap(78, 78, 78)
                                .addGroup(newUsernamePanelLayout.createParallelGroup()
                                    .addGroup(newUsernamePanelLayout.createSequentialGroup()
                                        .addComponent(newUsernameLabel)
                                        .addGap(18, 18, 18)
                                        .addComponent(newUsernameTextField, GroupLayout.PREFERRED_SIZE, 193, GroupLayout.PREFERRED_SIZE))
                                    .addGroup(newUsernamePanelLayout.createSequentialGroup()
                                        .addComponent(requirePINLabel)
                                        .addGap(27, 27, 27)
                                        .addComponent(requirePINTextField, GroupLayout.PREFERRED_SIZE, 193, GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(requirePINButton)))
                                .addContainerGap(256, Short.MAX_VALUE))
                    );
                    newUsernamePanelLayout.setVerticalGroup(
                        newUsernamePanelLayout.createParallelGroup()
                            .addGroup(newUsernamePanelLayout.createSequentialGroup()
                                .addGap(36, 36, 36)
                                .addGroup(newUsernamePanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                    .addComponent(newUsernameLabel)
                                    .addComponent(newUsernameTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(36, 36, 36)
                                .addGroup(newUsernamePanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                    .addComponent(requirePINTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                    .addComponent(requirePINLabel)
                                    .addComponent(requirePINButton))
                                .addContainerGap(86, Short.MAX_VALUE))
                    );
                }

                GroupLayout ChangeTokenNameLayout = new GroupLayout(ChangeTokenName);
                ChangeTokenName.setLayout(ChangeTokenNameLayout);
                ChangeTokenNameLayout.setHorizontalGroup(
                    ChangeTokenNameLayout.createParallelGroup()
                        .addGroup(ChangeTokenNameLayout.createSequentialGroup()
                            .addComponent(newUsernamePanel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addContainerGap())
                );
                ChangeTokenNameLayout.setVerticalGroup(
                    ChangeTokenNameLayout.createParallelGroup()
                        .addGroup(ChangeTokenNameLayout.createSequentialGroup()
                            .addGap(15, 15, 15)
                            .addComponent(newUsernamePanel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGap(239, 239, 239))
                );
            }
            mainFrame.add(ChangeTokenName, BorderLayout.CENTER);
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
    private JMenu aboutMenu;
    private JPanel LoginScreen;
    private JLabel pinLabel;
    private JPasswordField passwordField;
    private JButton loginButton;
    private JPanel ChangeTokenName;
    private JPanel newUsernamePanel;
    private JLabel newUsernameLabel;
    private JTextField newUsernameTextField;
    private JLabel requirePINLabel;
    private JTextField requirePINTextField;
    private JButton requirePINButton;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
