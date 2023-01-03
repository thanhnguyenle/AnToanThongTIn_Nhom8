package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.payment;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.PEMException;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.model.*;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.BillService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PublicKeyService;

import java.io.*;
import java.nio.file.Paths;
import java.security.PublicKey;
import java.security.Security;
import java.sql.Timestamp;
import java.util.Base64;

@WebServlet(name = "UploadInvoice_Servlet", value = "/upload-invoice")
@MultipartConfig(maxFileSize = 16177215)
public class UploadInvoice extends HttpServlet {
    PublicKeyService publicKeyService = PublicKeyService.getInstance();
    BillService billService = BillService.getInstance();
    PDFChecker pdfChecker = PDFChecker.getInstance();
    public UploadInvoice() {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
        HttpSession httpSession = request.getSession();
        Account acc = (Account) httpSession.getAttribute("account");
        if(acc!=null){
            InputStream inputStream_temp = null;
            InputStream inputStream = null; // input stream of the upload file
            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("file");
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
                inputStream_temp = new ByteArrayInputStream(resultBuff);
            }
                if (inputStream != null) {
                    //get inputstream to certificate
                    InputStream is = publicKeyService.getCertificateByStatus(acc.getId(),MyCertificate.SELECTED).get(0).getData();
                    PublicKey pubKey = null;
                    Reader pemReader = new BufferedReader(new InputStreamReader(is));
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
                 boolean check = pdfChecker.checkDigitalSignPDF(inputStream,"thestarbuck",pubKey);
                    String verifyComment = "";
                    if (check) {
                        verifyComment = "Verify is success!";
                        Bill bill = new Bill();
                        bill.setBillID("");
                        bill.setAccountID(acc.getId());
                        bill.setData(inputStream_temp);
                        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                        bill.setTimestamp(timestamp.getTime());
                        billService.save(bill);
                    } else
                        verifyComment = "Verify is fail! Re-again";
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    String json = new Gson().toJson(verifyComment);
                    try (PrintWriter out = response.getWriter()) {
                        out.println(json);
                    }
                }
        }
    }

}
