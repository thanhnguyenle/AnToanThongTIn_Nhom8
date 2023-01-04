package vn.edu.hcmuaf.fit.laptrinhweb.controller;

import com.itextpdf.forms.PdfAcroForm;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.signatures.*;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.PdfDictionary;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfStamper;
import org.bouncycastle.asn1.x500.RDN;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.asn1.x500.style.IETFUtils;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import com.itextpdf.layout.Document;
import org.bouncycastle.openssl.PEMException;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.BillService;

import java.io.*;
import java.lang.reflect.Field;
import java.security.*;
import java.util.*;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.util.logging.Logger;
import java.util.stream.Stream;

public class Test {
    private static Logger LOG = Logger.getLogger(Test.class.getName());

    private static final String COUNTRY = "2.5.4.6";
    private static final String STATE = "2.5.4.8";
    private static final String LOCALE = "2.5.4.7";
    private static final String ORGANIZATION = "2.5.4.10";
    private static final String ORGANIZATION_UNIT = "2.5.4.11";
    private static final String COMMON_NAME = "2.5.4.3";
    private static final String EMAIL = "2.5.4.9";
    public static final String KEYSTORE = "newKeyStoreFileName.jks";
    public static final char[] PASSWORD = "password".toCharArray();
    public static final String SRC = "test.pdf";
    public static final String DEST = "test-signed.pdf";
    BillService billService = BillService.getInstance();
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
            char[] pwdArray = "password".toCharArray();
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
    public void exportCertificate(){
        String command = "keytool -certreq -file newcsr.csr -alias thestarbuck -keystore "+KEYSTORE;

        try {
            Process process = Runtime.getRuntime().exec(command);

            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(process.getOutputStream()));
            writer.write("password");
            writer.write('\n');
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
    public void convertFromJKSToPKCS12(){
        String command = "keytool -importkeystore -srckeystore "+KEYSTORE+" -destkeystore keystore.p12 -deststoretype PKCS12";

        try {
            Process process = Runtime.getRuntime().exec(command);
            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(process.getOutputStream()));
            writer.write("password");
            writer.write('\n');
            writer.write("password");
            writer.write('\n');
            writer.write("password");
            writer.write('\n');
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
    public void exportPrivateKey(){
        String command = "openssl pkcs12 -in keystore.p12  -nodes -nocerts -out mydomain.key -legacy "+KEYSTORE;
        try {
            Process process = Runtime.getRuntime().exec(command);

            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(process.getOutputStream()));
            writer.write("password");
            writer.write('\n');
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

    public void checkCertificate() {
        InputStream is;
        try {
             is = new FileInputStream("MarkJ.csr");
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }

       // PKCS10CertificationRequest csr = convertPemToPKCS10CertificationRequest(is);
        Reader pemReader = new BufferedReader(new InputStreamReader(is));
        PEMParser pemParser = new PEMParser(pemReader);;
        PKCS10CertificationRequest csr = null;
        try {
            csr = (PKCS10CertificationRequest)pemParser.readObject();
            SubjectPublicKeyInfo pkInfo = csr.getSubjectPublicKeyInfo();
            JcaPEMKeyConverter converter = new JcaPEMKeyConverter();
            try {
                PublicKey pubKey = converter.getPublicKey(pkInfo);
                System.out.println(new String(Base64.getEncoder().encode(pubKey.getEncoded())));
            } catch (PEMException e) {
                throw new RuntimeException(e);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String compname = null;

        if (csr == null) {
            System.err.println("FAIL! conversion of Pem To PKCS10 Certification Request");
        } else {
            X500Name x500Name = csr.getSubject();
            System.out.println("x500Name is: " + x500Name + "\n");
            RDN cn = x500Name.getRDNs(BCStyle.CN)[0];

            System.out.println("CN = "+ IETFUtils.valueToString(cn.getFirst().getValue()));
        }
    }

    //    keytool -genkeypair -alias thestarbuck -keyalg RSA -keystore newKeyStoreFileName.jks
    public void loadEntriesToKeyStoreFile(String keyStoreFileName, String pwKeyStore, String urFullname, String orgUnit, String orgName, String city, String state, String countryCode) {
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
    public void sign(String src, String dest,
                     Certificate[] chain, PrivateKey pk, String digestAlgorithm, String provider,
                     PdfSigner.CryptoStandard subfilter, String reason, String location)
            throws GeneralSecurityException, IOException {
        IExternalDigest digest = new BouncyCastleDigest();
        // Creating the reader and the stamper
        PdfReader reader = new PdfReader(src);
        FileOutputStream os = new FileOutputStream(dest);
        PdfSigner signer = new PdfSigner(reader, os, new StampingProperties());
        signer.setFieldName("thestarbuck");
        //appearance
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
//        signer.setFieldName("sig");

        IExternalSignature signature =
                new PrivateKeySignature(pk, digestAlgorithm, provider);
        signer.signDetached(digest, signature, chain, null, null,
                null, 0, PdfSigner.CryptoStandard.CMS);
        os.close();
        reader.close();

    }
    void extractHashes(InputStream inputStream, NLUHash nluHash) throws Exception
    {
        Provider provider = new BouncyCastleProvider();
        Security.addProvider(provider);

        com.itextpdf.text.pdf.PdfReader reader = new com.itextpdf.text.pdf.PdfReader(inputStream, null);
        AcroFields tFields = reader.getAcroFields();
        tFields.removeField("thestarbuck");
// We create an OutputStream for the new PDF
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
// Now we create the PDF
        PdfStamper stamper = new PdfStamper(reader, baos);
        byte[] pdfBytes = baos.toByteArray();
        InputStream is = new ByteArrayInputStream(pdfBytes);

//        String tSig = (String) tFields.getSignatureNames().get(0);
//        PdfDictionary tDic = tFields.getSignatureDictionary(tSig);
//        com.itextpdf.text.pdf.PdfString pdfObject = (com.itextpdf.text.pdf.PdfString) reader.getPdfObject(tDic.get(PdfName.CONTENTS));
//        byte[] org = pdfObject.getOriginalBytes();
//        InputStream is = new ByteArrayInputStream(org);
        System.out.println(nluHash.hashByte(is));
//        List<String> names = af.getSignatureNames();

//        for (String name: names)
//        {
//            if(name.equals("thestarbuck")){
//                com.itextpdf.text.pdf.security.PdfPKCS7 pdfPkcs7 = af.verifySignature(name);
//                pdfPkcs7.verify();
//
//                Field digestAttrField = com.itextpdf.text.pdf.security.PdfPKCS7.class.getDeclaredField("digestAttr");
//                digestAttrField.setAccessible(true);
//                byte[] digestAttr = (byte[]) digestAttrField.get(pdfPkcs7);
//                String hash = new String(Base64.getEncoder().encode(digestAttr));
//                System.out.println(hash);
//            }

            // process the digest value in digestAttr
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
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void testVerifyPdfSampleSigned() throws IOException, GeneralSecurityException {
        File file = new File(DEST);
        try {
            InputStream resource = billService.getItem("bi0002").getData();
            PdfDocument pdfDoc = new PdfDocument(new PdfReader(resource));
            SignatureUtil signUtil = new SignatureUtil(pdfDoc);
            List<String> names = signUtil.getSignatureNames();
            for (String name : names) {
                System.out.println("===== " + name + " =====");
                System.out.println("Signature covers whole document: " + signUtil.signatureCoversWholeDocument(name));
                System.out.println("Document revision: " + signUtil.getRevision(name) + " of " + signUtil.getTotalRevisions());
                PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);
//                pkcs7.getSigningCertificate().verify();
//               byte[] data = pkcs7.getSigningInfoVersion();
//                System.out.println(Arrays.toString(data));
//                System.out.println(pkcs7.getEncodedPKCS7(pkcs7.));
//                CertificateInfo.getSubjectFields(pkcs7.getSigningCertificate()).
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

    public void printPublicKeyInKeyStore() throws KeyStoreException, IOException, CertificateException, NoSuchAlgorithmException {
        KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
        ks.load(new FileInputStream(KEYSTORE), PASSWORD);
        String alias = (String) ks.aliases().nextElement();
//            char[] pwdArray = "password".toCharArray();
//            PrivateKey pk = (PrivateKey) ks.getKey(alias, pwdArray);
        Certificate cert = ks.getCertificate(alias);
        // Get public key
        PublicKey publicKey = cert.getPublicKey();
        System.out.println(publicKey);
    }

    public static void main(String[] args) throws IOException {
        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
        Test test = new Test();
//        File file = new File(DEST);
//        NLUHash nluHash = new NLUHash("SHA256");
//        try {
//            test.extractHashes(new FileInputStream(file),nluHash);
//            System.out.println("--------------------------------------------------------");
//            File file1 = new File(SRC);
//
//            String hash = nluHash.hashByte(new FileInputStream(file1));
//            System.out.println(hash);
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
        //test.checkCertificate();
//        test.createKeyStoreFile();
//        test.loadEntriesToKeyStoreFile(KEYSTORE, "password", "HUU DAO", "VN", "NLU", "HCM", "THU DUC", "+84");
       // test.generatePDF();
//        test.exportCertificate();
//        test.createSignApperience();
//        test.createKeyStoreFile();
//        test.loadEntriesToKeyStoreFile(KEYSTORE, "password", "HUU DAO", "VN", "NLU", "HCM", "THU DUC", "+84");
        try {
            test.testVerifyPdfSampleSigned();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }

    }
}