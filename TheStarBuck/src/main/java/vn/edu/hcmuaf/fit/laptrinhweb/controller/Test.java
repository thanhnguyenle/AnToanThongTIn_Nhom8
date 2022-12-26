package vn.edu.hcmuaf.fit.laptrinhweb.controller;

import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.Document;
import com.itextpdf.signatures.*;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.*;
import java.security.*;
import java.security.cert.Certificate;
import java.util.List;

public class Test {

    public static final String KEYSTORE = "newKeyStoreFileName.jks";
    public static final char[] PASSWORD = "password".toCharArray();
    public static final String SRC = "test.pdf";
    public static final String DEST = "test-signed.pdf";
    public boolean generatePDF() {
        File file = new File(SRC);
        try {
            PdfWriter pdfWriter = new PdfWriter(file);
            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            Document document = new Document(pdfDocument);
            pdfDocument.setDefaultPageSize(PageSize.A4);
            document.close();

            BouncyCastleProvider provider = new BouncyCastleProvider();
            Security.addProvider(provider);
            KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
            ks.load(new FileInputStream(KEYSTORE), PASSWORD);
            String alias = (String) ks.aliases().nextElement();
            char[] pwdArray = "".toCharArray();
            PrivateKey pk = (PrivateKey) ks.getKey(alias, pwdArray);
            Certificate[] chain = ks.getCertificateChain(alias);

            sign(SRC, String.format(DEST, 1), chain, pk, DigestAlgorithms.SHA256,
                    provider.getName(), PdfSigner.CryptoStandard.CMS, "Test 1", "Ghent");

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    //    keytool -genkeypair -alias thestarbuck -keyalg RSA -keystore newKeyStoreFileName.jks
    public void createKeyStoreFile(){
        KeyStore ks = null;
        try {
            ks = KeyStore.getInstance("pkcs12");
            char[] pwdArray = "password".toCharArray();
            ks.load(null, pwdArray);
            try (FileOutputStream fos = new FileOutputStream("newKeyStoreFileName.jks")) {
                ks.store(fos, pwdArray);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public void sign(String src, String dest,
                     Certificate[] chain, PrivateKey pk, String digestAlgorithm, String provider,
                     PdfSigner.CryptoStandard subfilter, String reason, String location)
            throws GeneralSecurityException, IOException {
        IExternalDigest digest = new BouncyCastleDigest();
        // Creating the reader and the stamper
        PdfReader reader = new PdfReader(src);
        FileOutputStream os = new FileOutputStream(dest);
        PdfSigner signer = new PdfSigner(reader, os, new StampingProperties());

        //appearance
//        Rectangle rect = new Rectangle(36, 648, 200, 100);
//        PdfSignatureAppearance appearance = signer.getSignatureAppearance();
//        appearance
//                .setReason("Test")
//                .setLocation("Ghent")
//
//                // Specify if the appearance before field is signed will be used
//                // as a background for the signed field. The "false" value is the default value.
//                .setReuseAppearance(false)
//                .setPageRect(rect)
//                .setPageNumber(1);
//        signer.setFieldName("sig");

        IExternalSignature signature =
                new PrivateKeySignature(pk, digestAlgorithm, provider);
        signer.signDetached(digest, signature, chain, null, null,
                null, 0, PdfSigner.CryptoStandard.CMS);
        os.close();
        reader.close();

    }
    public void createSignApperience(){
        try {
            PdfReader reader = new PdfReader(SRC);
            PdfSigner signer = null;
            signer = new PdfSigner(reader, new FileOutputStream(DEST), new StampingProperties());
            Rectangle rect = new Rectangle(36, 648, 200, 100);
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
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void testVerifyPdfSampleSigned() throws IOException, GeneralSecurityException {
        File file = new File(DEST);
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

    public static void main(String[] args) throws IOException {
        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
        Test test = new Test();
//        test.generatePDF();
//        test.createSignApperience();
//        test.createKeyStoreFile();
//        try {
//            test.testVerifyPdfSampleSigned();
//        } catch (GeneralSecurityException e) {
//            e.printStackTrace();
//        }
    }
}