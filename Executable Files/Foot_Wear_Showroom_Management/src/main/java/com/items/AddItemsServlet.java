package com.items;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


/*
@WebServlet("/add-items/*")
@MultipartConfig
public class AddItemsServlet extends HttpServlet {

    protected void doGet(
            jakarta.servlet.http.HttpServletRequest request,
            jakarta.servlet.http.HttpServletResponse response)
            throws ServletException, IOException {

        String itemName =
        request.getParameter("item_name");

        int itemSize =
        Integer.parseInt(
        request.getParameter("item_size"));

        int quantity =
        Integer.parseInt(
        request.getParameter("quantity"));

        double price =
        Double.parseDouble(
        request.getParameter("price"));

        Part imagePart =
        request.getPart("item_image");

        String fileName =
        Paths.get(
        imagePart.getSubmittedFileName())
        .getFileName()
        .toString();

        // IMAGE SAVE FOLDER

        String uploadPath =
        getServletContext().getRealPath("")
        + File.separator
        + "item_listing_images";

        File uploadDir =
        new File(uploadPath);

        if(!uploadDir.exists()){

            uploadDir.mkdir();

        }

        imagePart.write(
        uploadPath + File.separator + fileName);

        String imageUrl =
        "item_listing_images/" + fileName;

        Connection conn = null;

        try{

            Class.forName(
            "org.postgresql.Driver");

            conn =
            DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/footwearshowroom",
            "postgres",
            "root"
            );

            conn.setAutoCommit(false);

            // STEP 1

            String insertInventory =
            "insert into item_listing_inventory "
            + "(item_name, item_size, image_url, quantity) "
            + "values (?, ?, ?, ?) returning id";

            PreparedStatement ps1 =
            conn.prepareStatement(insertInventory);

            ps1.setString(1, itemName);
            ps1.setInt(2, itemSize);
            ps1.setString(3, imageUrl);
            ps1.setInt(4, quantity);

            ResultSet rs =
            ps1.executeQuery();

            int itemId = 0;

            if(rs.next()){

                itemId = rs.getInt("id");

            }

            // STEP 2

            String insertPrice =
            "insert into price_listing_inventory "
            + "(item_id, price) "
            + "values (?, ?)";

            PreparedStatement ps2 =
            conn.prepareStatement(insertPrice);

            ps2.setInt(1, itemId);
            ps2.setDouble(2, price);

            ps2.executeUpdate();

            conn.commit();

            response.sendRedirect("AddItems.jsp");

        }catch(Exception e){

            try{

                conn.rollback();

            }catch(Exception ex){

                ex.printStackTrace();

            }

            e.printStackTrace();

        }

    }

}
*/

@WebServlet("/add-items/*")
@MultipartConfig
public class AddItemsServlet extends HttpServlet {

    // OPEN PAGE

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
        "/AddItems.jsp")
        .forward(request, response);

    }

    // HANDLE FORM SUBMIT

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String itemName =
        request.getParameter("item_name");

        int itemSize =
        Integer.parseInt(
        request.getParameter("item_size"));

        int quantity =
        Integer.parseInt(
        request.getParameter("quantity"));

        double price =
        Double.parseDouble(
        request.getParameter("price"));

        // remaining insert logic here
        
 

                Part imagePart =
                request.getPart("item_image");

                String fileName =
                Paths.get(
                imagePart.getSubmittedFileName())
                .getFileName()
                .toString();

                // IMAGE SAVE FOLDER

                String uploadPath =
                getServletContext().getRealPath("/")
                + File.separator
                + "item_listing_images";

                File uploadDir =
                new File(uploadPath);

                if(!uploadDir.exists()){

                    uploadDir.mkdir();

                }

                imagePart.write(
                uploadPath + File.separator + fileName);

                String imageUrl =
                "item_listing_images/" + fileName;

                Connection conn = null;

                try{

                    Class.forName(
                    "org.postgresql.Driver");

                    conn =
                    DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/footwearshowroom",
                    "postgres",
                    "root"
                    );

                    conn.setAutoCommit(false);

                    // STEP 1

                    String insertInventory =
                    "insert into item_listing_inventory "
                    + "(item_name, item_size, image_url, quantity) "
                    + "values (?, ?, ?, ?) returning id";

                    PreparedStatement ps1 =
                    conn.prepareStatement(insertInventory);

                    ps1.setString(1, itemName);
                    ps1.setInt(2, itemSize);
                    ps1.setString(3, imageUrl);
                    ps1.setInt(4, quantity);

                    ResultSet rs =
                    ps1.executeQuery();

                    int itemId = 0;

                    if(rs.next()){

                        itemId = rs.getInt("id");

                    }

                    // STEP 2

                    String insertPrice =
                    "insert into price_listing_inventory "
                    + "(item_id, price) "
                    + "values (?, ?)";

                    PreparedStatement ps2 =
                    conn.prepareStatement(insertPrice);

                    ps2.setInt(1, itemId);
                    ps2.setDouble(2, price);

                    ps2.executeUpdate();

                    conn.commit();
                    System.out.println(uploadPath);
                    response.sendRedirect("AddItems.jsp");

                }catch(Exception e){

                    try{

                        conn.rollback();

                    }catch(Exception ex){

                        ex.printStackTrace();

                    }

                    e.printStackTrace();

                

    }

}
}