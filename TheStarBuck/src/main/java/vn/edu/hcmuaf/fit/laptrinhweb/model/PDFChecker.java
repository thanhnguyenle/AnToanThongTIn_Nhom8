package vn.edu.hcmuaf.fit.laptrinhweb.model;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.signatures.CertificateInfo;
import com.itextpdf.signatures.PdfPKCS7;
import com.itextpdf.signatures.SignatureUtil;
import org.bouncycastle.crypto.CryptoException;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.*;
import java.security.*;
import java.security.cert.CertificateException;
import java.util.List;

public class PDFChecker {
    private static PDFChecker instance;

    private PDFChecker() {
    }
    public static PDFChecker getInstance(){
        if(instance==null) instance = new PDFChecker();
        return instance;
    }
    public boolean checkDigitalSignPDF(InputStream inputStream,String nameSign, PublicKey publicKey){
            try {
                try {
                    PdfDocument pdfDoc = new PdfDocument(new PdfReader(inputStream));
                    SignatureUtil signUtil = new SignatureUtil(pdfDoc);
                    List<String> names = signUtil.getSignatureNames();
                    for (String name : names) {
                        if(name.equals(nameSign)){
                            PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);
//                           //"Integrity check OK? " => pkcs7.verifySignatureIntegrityAndAuthenticity()
                            return pkcs7.verifySignatureIntegrityAndAuthenticity()&&checkDigitalSign(pkcs7,publicKey);
                        }
                    }
                    pdfDoc.close();
                    inputStream.close();
                } catch (IOException e) {
                   e.printStackTrace();
                }
            }catch (GeneralSecurityException e){
                e.printStackTrace();
            }
            return false;
    }
    public boolean checkDigitalSign(PdfPKCS7 pkcs7,PublicKey publicKey){
        try {
            pkcs7.getSigningCertificate().verify(publicKey);
            return true;
        }
        // Verification failed
        catch (InvalidKeyException | SignatureException ex) {
            return false;
        }
        // Problem verifying
        catch (NoSuchProviderException | NoSuchAlgorithmException | CertificateException ex) {
           ex.printStackTrace();
        }
        return false;
    }

}
