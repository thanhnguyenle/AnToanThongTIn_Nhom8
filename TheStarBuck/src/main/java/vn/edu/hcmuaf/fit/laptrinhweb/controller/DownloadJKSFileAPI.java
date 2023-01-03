package vn.edu.hcmuaf.fit.laptrinhweb.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.GenderKeyStore;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyPairKey;

import java.io.*;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.util.Base64;

@WebServlet(name = "DownloadJKSFileAPI",urlPatterns = {"/downloadJKSFile"})
public class DownloadJKSFileAPI extends HttpServlet {
    GenderKeyStore myKeyStore = GenderKeyStore.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = "keystore.jks";//request.getParameter("fileName");
        if(fileName == null || fileName.equals("")){
            throw new ServletException("File name can't be null or empty");
        }
        ServletContext context = request.getServletContext();
        String fullPath = context.getRealPath("/template/keystore.jks");
        File file = new File(fullPath);
        if(!file.exists()){
            throw new ServletException("File doesn't exists on server");
        }
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
        String mimeType = context.getMimeType(file.getAbsolutePath());
        response.setContentType(mimeType != null? mimeType:"application/octet-stream");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        ServletOutputStream sos = response.getOutputStream();
        byte[] bufferData = new byte[1024];
        int read = 0;
        while((read = bis.read(bufferData))!=-1){
            sos.write(bufferData,0,read);
        }
        sos.flush();
        sos.close();
        bis.close();
        System.out.println("File downloaded at client successfully");
    }

}
