package org.example.controller;

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

import java.io.*;
import java.security.*;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.util.List;

public class PDFDigitalSigning {
//    private String billPath = "hoadon.pdf";
//    private String keyStorePath = "keyStoreFile.jks";
//
//    public String getBillPath() {
//        return billPath;
//    }

//    public void setBillPath(String billPath) {
//        this.billPath = billPath;
//    }
//
//    public String getKeyStorePath() {
//        return keyStorePath;
//    }

//    public void setKeyStorePath(String keyStorePath) {
//        this.keyStorePath = keyStorePath;
//    }

    public void createKeyStoreFile(String password, String keyStorePath){
        KeyStore ks = null;
        try {
            ks = KeyStore.getInstance("pkcs12");
            char[] pwdArray = password.toCharArray();
            ks.load(null, pwdArray);
            try (FileOutputStream fos = new FileOutputStream(keyStorePath)) {
                ks.store(fos, pwdArray);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //    keytool -genkeypair -alias thestarbuck -keyalg RSA -keystore newKeyStoreFileName.jks
    public static void loadEntriesToKeyStoreFile(String keyStoreFileName, String pwKeyStore, String urFullname, String orgUnit, String orgName, String city, String state, String countryCode) {
        String command = "keytool -genkeypair -alias thestarbuck -keyalg RSA -keystore "  + keyStoreFileName;

        try {
            Process process = Runtime.getRuntime().exec(command);

            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(process.getOutputStream()));
            writer.write(pwKeyStore);
            writer.write('\n');
            writer.write(urFullname);
            writer.write('\n');
            writer.write(orgUnit);
            writer.write('\n');
            writer.write(orgName);
            writer.write('\n');
            writer.write(city);
            writer.write('\n');
            writer.write(state);
            writer.write('\n');
            writer.write(countryCode);
            writer.write('\n');
            writer.write("yes");
            writer.flush();

            writer.close();

            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static boolean signBill(String billPath, String keyStorePassword, String keyStorePath) {
        try {
            String billSignedPath ;
            BouncyCastleProvider provider = new BouncyCastleProvider();
            Security.addProvider(provider);
            KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
            char[] keystorePassArr = keyStorePassword.toCharArray();
            ks.load(new FileInputStream(keyStorePath), keystorePassArr);
            String alias = (String) ks.aliases().nextElement();
            char[] privateKeyPassArr = keyStorePassword.toCharArray();
            PrivateKey pk = (PrivateKey) ks.getKey(alias, privateKeyPassArr);
            Certificate[] chain = ks.getCertificateChain(alias);
            billSignedPath = billPath.substring(0,billPath.length() - 4) + "-signed.pdf";
            sign(billPath, String.format(billSignedPath, 1), chain, pk, DigestAlgorithms.SHA256,
                    provider.getName(), PdfSigner.CryptoStandard.CMS, "Test 1", "Ghent");
        } catch (Exception e) {
            return false;
        }
        return true;

    }

    public static void sign(String src, String dest,
                     Certificate[] chain, PrivateKey pk, String digestAlgorithm, String provider,
                     PdfSigner.CryptoStandard subfilter, String reason, String location)
            throws GeneralSecurityException, IOException {
        IExternalDigest digest = new BouncyCastleDigest();
        // Creating the reader and the stamper
        PdfReader reader = new PdfReader(src);
        FileOutputStream os = new FileOutputStream(dest,true);
        PdfSigner signer = new PdfSigner(reader, os, new StampingProperties());

        //appearance
        createSignApperience(signer);

        IExternalSignature signature =
                new PrivateKeySignature(pk, digestAlgorithm, provider);
        signer.signDetached(digest, signature, chain, null, null,
                null, 0, PdfSigner.CryptoStandard.CMS);
        os.close();
        reader.close();

    }

    private static void createSignApperience(PdfSigner signer){
        Rectangle rect = new Rectangle(36, 250 , 200, 100);
        PdfSignatureAppearance appearance = signer.getSignatureAppearance();
        appearance
                .setReason("Test")
                .setLocation("Ghent")

                // Specify if the appearance before field is signed will be used
                // as a background for the signed field. The "false" value is the default value.
                .setReuseAppearance(false)
                .setPageRect(rect)
                .setPageNumber(1);
        signer.setFieldName("sig");
    }

    public static void testVerifyPdfSampleSigned() throws IOException, GeneralSecurityException {
        File file = new File("hoadonSigned.pdf");
        try {
            InputStream resource = new FileInputStream(file);
            PdfDocument pdfDoc = new PdfDocument(new PdfReader(resource));
            SignatureUtil signUtil = new SignatureUtil(pdfDoc);
            List<String> names = signUtil.getSignatureNames();
            for (String name : names) {
                System.out.println("===== " + name + " =====");
                System.out.println("Signature covers whole document: " + signUtil.signatureCoversWholeDocument(name));
                System.out.println("Document revision: " + signUtil.getRevision(name) + " of " + signUtil.getTotalRevisions());
                PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);

                System.out.println("Subject: " + CertificateInfo.getSubjectFields(pkcs7.getSigningCertificate()));
                System.out.println("Integrity check OK? " + pkcs7.verifySignatureIntegrityAndAuthenticity());
            }
            pdfDoc.close();
            resource.close();
            System.out.println();
        }catch (GeneralSecurityException e){
            e.printStackTrace();
        }
    }

    public static void verifyPdfSignedIntegrity(String billSignedPath) throws IOException, GeneralSecurityException {
        File file = new File(billSignedPath);
        try {
            InputStream resource = new FileInputStream(file);
            PdfDocument pdfDoc = new PdfDocument(new PdfReader(resource));
            SignatureUtil signUtil = new SignatureUtil(pdfDoc);
            List<String> names = signUtil.getSignatureNames();
            for (String name : names) {
                System.out.println("===== " + name + " =====");
                System.out.println("Signature covers whole document: " + signUtil.signatureCoversWholeDocument(name));
                System.out.println("Document revision: " + signUtil.getRevision(name) + " of " + signUtil.getTotalRevisions());
                PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);

                System.out.println("Subject: " + CertificateInfo.getSubjectFields(pkcs7.getSigningCertificate()));
                System.out.println("Integrity check OK? " + pkcs7.verifySignatureIntegrityAndAuthenticity());
            }
            pdfDoc.close();
            resource.close();
            System.out.println();
        }catch (GeneralSecurityException e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        String billPath = "hoadon.pdf";
//        String password = "password";
//        String billSignedPath = billPath.substring(0,billPath.length() - 4) + "-signed.pdf";
//        String keyStoreFile = "keyStoreFile.jks";
//        BouncyCastleProvider provider = new BouncyCastleProvider();
//        Security.addProvider(provider);
//        PDFDigitalSigning sign = new PDFDigitalSigning();
//        sign.signBill(billPath, password, keyStoreFile);
//        sign.createKeyStoreFile("password",keyStoreFile);
//        sign.loadEntriesToKeyStoreFile(keyStoreFile, "password", "HUU DAO", "VN", "NLU", "HCM", "THU DUC", "+84");
//        sign.changePasswordKeyStoreFile("newKeyStoreFileName.jks", "password", "password");
//        try {
//            sign.verifyPdfSignedIntegrity(billSignedPath);
//        } catch (GeneralSecurityException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }

    }
}
