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
import com.tap.dao.RestaurantDAO;
import com.tap.daoimple.RestaurantDAOImple;
import com.tap.model.Restaurant;

@WebServlet("/AddRestaurantServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddRestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "/images/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String restaurantName = request.getParameter("restaurantName");
        String imagePath = handleFileUpload(request.getPart("imagePath"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
        String cuisineType = request.getParameter("cuisineType");
        String address = request.getParameter("address");
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        int restaurantAdmin = Integer.parseInt(request.getParameter("restaurantAdmin"));

        // Create restaurant object
        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurantName(restaurantName);
        restaurant.setImagePath(imagePath);
        restaurant.setRating(rating);
        restaurant.setDeliveryTime(deliveryTime);
        restaurant.setCuisineType(cuisineType);
        restaurant.setAddress(address);
        restaurant.setActive(isActive);
        restaurant.setRestaurantAdmin(restaurantAdmin);

        // Add restaurant to database
        RestaurantDAO restaurantDAO = new RestaurantDAOImple();
        restaurantDAO.addRestaurant(restaurant);

        // Redirect to success page
        response.sendRedirect("success.jsp");
    }

    private String handleFileUpload(Part filePart) throws IOException, ServletException {
        String applicationPath = getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        
        // Ensure the upload directory exists
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // Create directories if they don't exist
        }

        // Construct the file path
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        Path filePath = Paths.get(uploadFilePath, fileName);

        try {
            Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();  // Log the error
            throw new ServletException("File upload failed due to an I/O error.", e);
        }

        // Return URL-encoded path
        return UPLOAD_DIR + File.separator + fileName;
    }
}
