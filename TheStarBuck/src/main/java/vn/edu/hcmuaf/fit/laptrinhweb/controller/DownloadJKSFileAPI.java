package vn.edu.hcmuaf.fit.laptrinhweb.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.GenderKeyStore;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyPairKey;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.util.Base64;

@WebServlet(name = "GenerateCertificateAPI",urlPatterns = {"/generate-cer"})
public class DownloadJKSFileAPI extends HttpServlet {
    GenderKeyStore myKeyStore = GenderKeyStore.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String cn = req.getParameter("CN");
            String ou = req.getParameter("OU");
            String o = req.getParameter("O");
            String l = req.getParameter("L");
            String s = req.getParameter("S");
            String c = req.getParameter("C");
            String keySize = req.getParameter("keySize");
            String algorithmGenKey = req.getParameter("algorithmGenKey");
            String algorithmHash = req.getParameter("algorithmHashing");
            String passKeyStore = req.getParameter("passKeyStore");
            String algorithmSig = "";
            if (algorithmGenKey.equals("EC")) {
                algorithmSig += algorithmHash + "withECDSA";
            } else {
                algorithmSig += algorithmHash + "with" + algorithmGenKey;
            }
            File file = getResourceFile(req);
            myKeyStore.createKeyStoreFile(file.getAbsolutePath(), passKeyStore);
            myKeyStore.loadEntriesToKeyStoreFile(file.getAbsolutePath(), passKeyStore, passKeyStore, algorithmGenKey, algorithmSig, keySize, cn, ou, o, s, l, c);

            MyPairKey myPairKey = new MyPairKey();
            //get KeyStore
            KeyStore ks = myKeyStore.getKeyStore(file.getAbsolutePath(),passKeyStore);
            String alias = (String) ks.aliases().nextElement();
            char[] pwdArray = passKeyStore.toCharArray();
            PrivateKey pk = (PrivateKey) ks.getKey(alias, pwdArray);
            Certificate[] chain = ks.getCertificateChain(alias);
            byte[] publicKeyBytes = Base64.getEncoder().encode(chain[0].getPublicKey().getEncoded());
            byte[] privateKeyBytes = Base64.getEncoder().encode(pk.getEncoded());
            myPairKey.setPrivateKey(new String(privateKeyBytes));
            myPairKey.setPublicKey(new String(publicKeyBytes));
//        myPairKey.setPrivateKey();
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
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    private File getResourceFile(HttpServletRequest request)
    {
        ServletContext context = request.getServletContext();
        String fullPath = context.getRealPath("/template/keystore.jks");
        System.out.println(fullPath);
        return new File(fullPath);
    }
}
