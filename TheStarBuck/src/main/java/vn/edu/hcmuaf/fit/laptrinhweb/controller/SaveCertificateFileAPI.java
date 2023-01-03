package vn.edu.hcmuaf.fit.laptrinhweb.controller;

import com.google.gson.Gson;
import com.sun.mail.iap.ByteArray;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.PEMException;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.GenderKeyStore;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyPairKey;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PublicKeyService;
import java.io.*;
import java.nio.file.Paths;
import java.security.PublicKey;
import java.security.Security;
import java.sql.Timestamp;
import java.util.Base64;


@WebServlet(name = "UploadCertificateFileAPI",urlPatterns = {"/upload-certificate"})
@MultipartConfig(maxFileSize = 16177215)
public class UploadCertificateFileAPI extends HttpServlet {
    GenderKeyStore myKeyStore = GenderKeyStore.getInstance();
    PublicKeyService publicKeyService = PublicKeyService.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
        HttpSession httpSession = req.getSession();
        Account acc = (Account) httpSession.getAttribute("account");
        if(acc!=null){
            InputStream inputStream = null; // input stream of the upload file
            // obtains the upload file part in this multipart request
            Part filePart = req.getPart("data-certificate");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (filePart != null) {
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
                InputStream imageStream = filePart.getInputStream();
                byte[] resultBuff = new byte[0];
                byte[] buff = new byte[1024];
                int k = -1;
                while ((k = imageStream.read(buff, 0, buff.length)) > -1) {
                    byte[] tbuff = new byte[resultBuff.length + k]; // temp buffer size
                    System.arraycopy(resultBuff, 0, tbuff, 0, resultBuff.length); // copy
                    System.arraycopy(buff, 0, tbuff, resultBuff.length, k); // copy
                    resultBuff = tbuff; // call the temp buffer as your result buff
                }
                inputStream = new ByteArrayInputStream(resultBuff);
            }
            MyPairKey myPairKey = new MyPairKey();
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                MyCertificate myCertificate = new MyCertificate();
                myCertificate.setKeyID("");
                myCertificate.setAccountID(acc.getId());
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                myCertificate.setStartDate(timestamp.getTime());
                myCertificate.setEndDate(0l);
                myCertificate.setData(inputStream);
                myCertificate.setStatus("AVAILABLE");
                publicKeyService.create(myCertificate);

                PublicKey pubKey = null;
                Reader pemReader = new BufferedReader(new InputStreamReader(inputStream));
                PEMParser pemParser = new PEMParser(pemReader);;
                PKCS10CertificationRequest csr;
                try {
                    csr = (PKCS10CertificationRequest) pemParser.readObject();
                    SubjectPublicKeyInfo pkInfo = csr.getSubjectPublicKeyInfo();
                    JcaPEMKeyConverter converter = new JcaPEMKeyConverter();
                    try {
                        pubKey = converter.getPublicKey(pkInfo);
                    } catch (PEMException e) {
                       e.printStackTrace();
                    }finally {
                        pemParser.close();
                        pemReader.close();
                        inputStream.close();
                    }
                } catch (IOException ex) {
                   ex.printStackTrace();
                }
                    myPairKey.setPublicKey(new String(Base64.getEncoder().encode( pubKey.getEncoded())));
                }


                if (myPairKey != null) {
                    resp.setContentType("application/json");
                    resp.setCharacterEncoding("utf-8");
                    String json = new Gson().toJson(myPairKey);
                    PrintWriter out = resp.getWriter();
                    try {
                        out.println(json);
                    } finally {
                        out.close();
                    }
                } else
                    System.err.println("ERROR!");
            }
        }
}
