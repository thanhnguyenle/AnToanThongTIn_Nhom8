package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.slide;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.SlideService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Map;

@WebServlet(name = "UpdateSlideServlet", value = "/updateSlider")
public class UpdateServlet extends HttpServlet {
    private final SlideService slideService = SlideService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id = request.getParameter("id");
//        Slide slide = slideService.getItem(id);
//
//        HttpSession session = request.getSession();
//        session.setAttribute("slide", slide);
//        request.getRequestDispatcher("/views/admin/slideManagement.jsp").forward(request, response);
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String request_titles = request.getParameter("titles");
        String request_minis = request.getParameter("minis");
        String request_banners = request.getParameter("banners");

        String titleH2 = request.getParameter("titleH2");
        String titleSpan = request.getParameter("titleSpan");
        String titleP = request.getParameter("titleP");
        String titleH2banner = request.getParameter("titleH2banner");
        String titleSpanbanner = request.getParameter("titleSpanbanner");

//        Slide slide = slideService.getItem()
        slideService.update(titleH2, titleSpan, titleP, true, "TITLE");
        slideService.update(titleH2banner, titleSpanbanner, "", true, "BANNER");
        Type empMapType = new TypeToken<Map<String, String>>() {
        }.getType();
        Map<String, String> jsonObjectTitles = new Gson().fromJson(request_titles, empMapType);
        for (Map.Entry entry : jsonObjectTitles.entrySet()) {
            String value = (String) entry.getValue();
            if (!value.isEmpty())
                slideService.updateImageByID((String) entry.getKey(), value, "TITLE");
        }
        Map<String, String> jsonObjectBanners = new Gson().fromJson(request_banners, empMapType);
        for (Map.Entry entry : jsonObjectBanners.entrySet()) {
            String value = (String) entry.getValue();
            if (!value.isEmpty())
                slideService.updateImageByID((String) entry.getKey(), value, "BANNER");
        }
        Map<String, String> jsonObjectMinis = new Gson().fromJson(request_banners, empMapType);

        for (Map.Entry entry : jsonObjectMinis.entrySet()) {
            String value = (String) entry.getValue();
            if (!value.isEmpty())
                slideService.updateImageByID((String) entry.getKey(), value, "MINI");
        }

        response.sendRedirect(request.getContextPath() + "/slide");
    }
}
