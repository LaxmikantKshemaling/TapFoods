package com.tap.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.tap.dao.MenuDAO;
import com.tap.daoimple.MenuDAOImple;
import com.tap.model.Menu;

@WebServlet("/AddMenu")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddMenuItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "/images/";

    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String imagePath = handleFileUpload(request.getPart("imagePath"));
            boolean isAvailable = request.getParameter("isAvailable") != null;
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            double rating = Double.parseDouble(request.getParameter("rating"));

            Menu menu = new Menu(menuId, name, price, description, imagePath, isAvailable, restaurantId, rating);
            menuDAO.addMenu(menu);

            response.sendRedirect("MenuListServlet?restaurantId=" + restaurantId);
        } catch (NumberFormatException | ServletException | IOException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page or handle appropriately
        }
    }

    private String handleFileUpload(Part filePart) throws IOException, ServletException {
        if (filePart == null || filePart.getSize() == 0) {
            return null; // No file uploaded
        }

        String applicationPath = getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // Create directories if they don't exist
        }

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        Path filePath = Paths.get(uploadFilePath, fileName);

        try {
            Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
            throw new ServletException("File upload failed due to an I/O error.", e);
        }

        return UPLOAD_DIR + File.separator + fileName;
    }
}
