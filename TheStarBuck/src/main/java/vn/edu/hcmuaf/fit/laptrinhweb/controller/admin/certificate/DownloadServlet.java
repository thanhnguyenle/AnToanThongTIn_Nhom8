package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.certificate;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PublicKeyService;

import java.io.BufferedInputStream;
import java.io.IOException;


@WebServlet(name = "DownloadCertificate_Servlet", value = "/downloadCertificate")
public class DownloadServlet extends HttpServlet {
  PublicKeyService publicKeyService = PublicKeyService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String fileName = "certificate-"+id+".csr";
        MyCertificate myCertificate= publicKeyService.getItem(id);
        BufferedInputStream bis = new BufferedInputStream(myCertificate.getData());
        response.setContentType("application/octet-stream");
        response.setContentLength(bis.available());
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/all-certificate");

    }
}
