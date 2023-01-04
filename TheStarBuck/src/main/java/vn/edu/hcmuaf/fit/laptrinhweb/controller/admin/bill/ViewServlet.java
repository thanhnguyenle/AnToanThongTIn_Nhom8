package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.bill;

import com.google.gson.Gson;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.signatures.CertificateInfo;
import com.itextpdf.signatures.PdfPKCS7;
import com.itextpdf.signatures.SignatureUtil;
import com.itextpdf.text.pdf.PdfName;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.bouncycastle.asn1.ASN1ObjectIdentifier;
import org.bouncycastle.asn1.x500.RDN;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.asn1.x500.style.IETFUtils;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.PEMException;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.tsp.TimeStampToken;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyPairKey;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.BillService;

import java.io.*;
import java.security.GeneralSecurityException;
import java.security.PublicKey;
import java.security.Security;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.List;


@WebServlet(name = "ViewBillServlet", value = "/viewBill")
public class ViewServlet extends HttpServlet {
  BillService billService = BillService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BouncyCastleProvider provider = new BouncyCastleProvider();
        Security.addProvider(provider);
      String id = request.getParameter("id");
     Bill bill = billService.getItem(id);
      InputStream inputStream = bill.getData();
      MyPairKey myPairKey = new MyPairKey();
      if(inputStream!=null){
          PdfDocument pdfDoc = new PdfDocument(new PdfReader(inputStream));
          SignatureUtil signUtil = new SignatureUtil(pdfDoc);
          List<String> names = signUtil.getSignatureNames();
          try {
              for (String name : names) {
                  if(name.equals("thestarbuck")){
                      signUtil.signatureCoversWholeDocument(name);
                      signUtil.getRevision(name);
                      signUtil.getTotalRevisions();
                      PdfPKCS7 pkcs7 = signUtil.readSignatureData(name);
                      X509Certificate cert = pkcs7.getSigningCertificate();
                      String info = "---- Certificate info ----\r\n";
                      info+="Common Name: "+ CertificateInfo.getSubjectFields(cert).getField("CN")+"\r\n";
                      info+="Organization Unit: "+CertificateInfo.getSubjectFields(cert).getField("OU")+"\r\n";
                      info+="Organization Name"+CertificateInfo.getSubjectFields(cert).getField("O")+"\r\n";
                      info+="Locality Name"+CertificateInfo.getSubjectFields(cert).getField("L")+"\r\n";
                      info+="State Name"+CertificateInfo.getSubjectFields(cert).getField("ST")+"\r\n";
                      info+="Country"+CertificateInfo.getSubjectFields(cert).getField("C")+"\r\n";;
                      info+="---- Other info ----\n\r";
                      info+="Digest algorithm: "+pkcs7.getHashAlgorithm()+"\r\n";
                      info+="Encryption algorithm: "+pkcs7.getEncryptionAlgorithm()+"\r\n";
                      info+="Locality: "+pkcs7.getLocation()+"\r\n";
                      info+="Reason: "+pkcs7.getReason()+"\r\n";

                      SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SS");
                      info+="Signed on: " + date_format.format(pkcs7.getSignDate().getTime())+"\r\n";
                      TimeStampToken ts = pkcs7.getTimeStampToken();
                      if(ts!=null)
                      info+="TimeStamp service: " + ts.getTimeStampInfo().getTsa()+"\r\n";
                      try {
                          info+="Timestamp verified? " + pkcs7.verifyTimestampImprint();
                      } catch (GeneralSecurityException e) {
                          info+="";
                      }
                      myPairKey.setInfo(info);
                  }
              }
          }catch (Exception e){
              e.printStackTrace();
          }finally {
              pdfDoc.close();
              inputStream.close();
          }
      }
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        String json = new Gson().toJson(myPairKey);
        PrintWriter out = response.getWriter();
        try {
          out.println(json);
        } finally {
          out.close();
        }


    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/all-bill");

    }
}
