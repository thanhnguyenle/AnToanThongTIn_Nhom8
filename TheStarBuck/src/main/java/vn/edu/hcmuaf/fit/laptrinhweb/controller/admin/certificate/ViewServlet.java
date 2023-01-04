package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.certificate;

import com.google.gson.Gson;
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
import org.bouncycastle.openssl.PEMException;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyPairKey;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PublicKeyService;

import java.io.*;
import java.security.PublicKey;
import java.util.Base64;


@WebServlet(name = "ViewCertificate_Servlet", value = "/viewCertificate")
public class ViewServlet extends HttpServlet {
  PublicKeyService publicKeyService = PublicKeyService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        MyCertificate myCertificate = publicKeyService.getItem(id);
        InputStream inputStream = myCertificate.getData();
        MyPairKey myPairKey = new MyPairKey();
        if (inputStream != null) {
            PublicKey pubKey = null;
            Reader pemReader = new BufferedReader(new InputStreamReader(inputStream));
            PEMParser pemParser = new PEMParser(pemReader);;
            PKCS10CertificationRequest csr;
            X500Name x500Name = null;
            try {
                csr = (PKCS10CertificationRequest) pemParser.readObject();
                SubjectPublicKeyInfo pkInfo = csr.getSubjectPublicKeyInfo();
                JcaPEMKeyConverter converter = new JcaPEMKeyConverter();
                x500Name= csr.getSubject();
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

            String info = "";
            info+=getText("Common Name", BCStyle.CN,x500Name)+"\r\n";
            info+=getText("Organization Unit",BCStyle.OU,x500Name)+"\r\n";
            info+=getText("Organization Name",BCStyle.O,x500Name)+"\r\n";
            info+=getText("Locality Name",BCStyle.L,x500Name)+"\r\n";
            info+=getText("State Name",BCStyle.ST,x500Name)+"\r\n";
            info+=getText("Country",BCStyle.C,x500Name);
            myPairKey.setInfo(info);
        }
        if (myPairKey != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            String json = new Gson().toJson(myPairKey);
            PrintWriter out = response.getWriter();
            try {
                out.println(json);
            } finally {
                out.close();
            }
        } else
            System.err.println("ERROR!");

    }
    public String getText(String title, ASN1ObjectIdentifier spec, X500Name x500Name){
        RDN cn = x500Name.getRDNs(spec)[0];
        return title+": "+ IETFUtils.valueToString(cn.getFirst().getValue());
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/all-certificate");

    }
}
