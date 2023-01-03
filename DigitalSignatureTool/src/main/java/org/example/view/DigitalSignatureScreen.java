/*
 * Created by JFormDesigner on Fri Dec 30 11:03:25 ICT 2022
 */

package org.example.view;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.example.controller.PDFDigitalSigning;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.StampingProperties;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Text;
import com.itextpdf.signatures.*;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import javax.swing.*;
import javax.swing.GroupLayout;
import javax.swing.filechooser.FileFilter;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.security.Security;

import static org.example.view.LoginControl.getPassword;

/**
 * @author unknown
 */
public class DigitalSignatureScreen extends JPanel {

    public String billPath;
    public String keyStorePath;
    public boolean isCheck = false;
    

    public DigitalSignatureScreen() {
        initComponents();
    }

    private void initComponents() {
        // JFormDesigner - Component initialization - DO NOT MODIFY  //GEN-BEGIN:initComponents  @formatter:off
        DigitalSignaturePanel = new JPanel();
        chooseFileLabel = new JLabel();
        chooseFileButton = new JButton();
        FileSignedPathLabel = new JLabel();
        signButton = new JButton();
        chooseSignatureLabel = new JLabel();
        chooseKeyStoreButton = new JButton();
        keyStorePathLabel = new JLabel();
        removeInfoButton = new JButton();

        //======== DigitalSignaturePanel ========
        {

            //---- chooseFileLabel ----
            chooseFileLabel.setText("L\u1ea5y File c\u1ea7n k\u00fd");

            //---- chooseFileButton ----
            chooseFileButton.setText("Ch\u1ecdn file");

            //---- FileSignedPathLabel ----
            FileSignedPathLabel.setText("\u0110\u01b0\u1eddng d\u1eabn:");

            //---- signButton ----
            signButton.setText("K\u00fd");

            //---- chooseSignatureLabel ----
            chooseSignatureLabel.setText("Ch\u1ecdn ch\u1eef k\u00fd");

            //---- chooseKeyStoreButton ----
            chooseKeyStoreButton.setText("Ch\u1ecdn file");

            //---- keyStorePathLabel ----
            keyStorePathLabel.setText("\u0110\u01b0\u1eddng d\u1eabn");

            //---- removeInfoButton ----
            removeInfoButton.setText("Xo\u00e1 to\u00e0n b\u1ed9 th\u00f4ng tin");

            GroupLayout DigitalSignaturePanelLayout = new GroupLayout(DigitalSignaturePanel);
            DigitalSignaturePanel.setLayout(DigitalSignaturePanelLayout);
            DigitalSignaturePanelLayout.setHorizontalGroup(
                DigitalSignaturePanelLayout.createParallelGroup()
                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(DigitalSignaturePanelLayout.createParallelGroup()
                            .addComponent(signButton)
                            .addComponent(removeInfoButton)
                            .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                                .addGroup(DigitalSignaturePanelLayout.createParallelGroup()
                                    .addComponent(chooseFileLabel)
                                    .addComponent(chooseSignatureLabel))
                                .addGap(18, 18, 18)
                                .addGroup(DigitalSignaturePanelLayout.createParallelGroup()
                                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                                        .addComponent(chooseKeyStoreButton)
                                        .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(keyStorePathLabel))
                                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                                        .addComponent(chooseFileButton)
                                        .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(FileSignedPathLabel)))))
                        .addContainerGap(387, Short.MAX_VALUE))
            );
            DigitalSignaturePanelLayout.setVerticalGroup(
                DigitalSignaturePanelLayout.createParallelGroup()
                    .addGroup(DigitalSignaturePanelLayout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addGroup(DigitalSignaturePanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(chooseFileLabel)
                            .addComponent(chooseFileButton)
                            .addComponent(FileSignedPathLabel))
                        .addGap(18, 18, 18)
                        .addGroup(DigitalSignaturePanelLayout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                            .addComponent(chooseSignatureLabel)
                            .addComponent(chooseKeyStoreButton)
                            .addComponent(keyStorePathLabel))
                        .addGap(18, 18, 18)
                        .addComponent(removeInfoButton)
                        .addGap(26, 26, 26)
                        .addComponent(signButton)
                        .addContainerGap(130, Short.MAX_VALUE))
            );
        }
        chooseFileButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                billPath = "";
                JFileChooser file = new JFileChooser();
                file.addChoosableFileFilter(new FileFilter() {
                    @Override
                    public boolean accept(File f) {
                        return f.getName().toLowerCase().endsWith(".pdf");
                    }

                    @Override
                    public String getDescription() {
                        return "File PDF";
                    }
                });
                file.showOpenDialog(null);
                File selectedFile = file.getSelectedFile();
                billPath = selectedFile.getAbsolutePath();
                FileSignedPathLabel.setText(billPath);

            }
        });
        chooseKeyStoreButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                keyStorePath = "";
                JFileChooser file = new JFileChooser();
                file.addChoosableFileFilter(new FileFilter() {
                    @Override
                    public boolean accept(File f) {
                        return f.getName().toLowerCase().endsWith(".jks");
                    }

                    @Override
                    public String getDescription() {
                        return "File Chữ ký";
                    }
                });
                file.showOpenDialog(null);
                File selectedFile = file.getSelectedFile();
                keyStorePath = selectedFile.getAbsolutePath();
                keyStorePathLabel.setText(keyStorePath);
            }
        });
        removeInfoButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                billPath = "";
                keyStorePath = "";
                isCheck = false;
                keyStorePathLabel.setText("");
                FileSignedPathLabel.setText("");
            }
        });
        signButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                    System.out.println(billPath);
//                    String inputPassword = JOptionPane.showInputDialog(null,passwordDialog);
                String inputPassword= "";
                JPanel panel = new JPanel();
                JLabel label = new JLabel("Enter a password:");
                JPasswordField pass = new JPasswordField(10);
                panel.add(label);
                panel.add(pass);
                String[] options = new String[]{"OK", "Cancel"};
                int option = JOptionPane.showOptionDialog(null, panel, "The title",
                        JOptionPane.NO_OPTION, JOptionPane.PLAIN_MESSAGE,
                        null, options, options[1]);
                if(option == 0) // pressing OK button
                {
                    char[] password = pass.getPassword();
                    inputPassword = password.toString();
                }

                    isCheck = false;
                    PDFDigitalSigning sign = new PDFDigitalSigning();
                    boolean isok = sign.signBill(billPath,inputPassword,keyStorePath);
                    if(isok == true) {
                        JOptionPane.showMessageDialog(getPanel(),"Ký thành công, vui lòng kiểm tra file đã ký trong thư mục chứa file gốc");

                    } else
                        JOptionPane.showMessageDialog(getPanel(),"Ký thất bại ");
                         JOptionPane.getRootFrame().dispose();


            }
        });
        // JFormDesigner - End of component initialization  //GEN-END:initComponents  @formatter:on
    }

    public JPanel getPanel() {
        return DigitalSignaturePanel;
    }
    // JFormDesigner - Variables declaration - DO NOT MODIFY  //GEN-BEGIN:variables  @formatter:off
    private JPanel DigitalSignaturePanel;
    private JLabel chooseFileLabel;
    private JButton chooseFileButton;
    private JLabel FileSignedPathLabel;
    private JButton signButton;
    private JLabel chooseSignatureLabel;
    private JButton chooseKeyStoreButton;
    private JLabel keyStorePathLabel;
    private JButton removeInfoButton;
    // JFormDesigner - End of variables declaration  //GEN-END:variables  @formatter:on
}
