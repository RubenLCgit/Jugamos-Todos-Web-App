package com.svalero.servlet;

import com.svalero.dao.ClubDAO;
import com.svalero.dao.Database;
import com.svalero.models.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/add-club")
public class AddClubServlet extends HttpServlet {
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String nom_club = req.getParameter("nom_club");
        String nom_calle = req.getParameter("nom_calle");
        String num_calle = req.getParameter("num_calle");
        String cp = req.getParameter("cp");
        String hor_apert = req.getParameter("hor_apert");
        String hor_cierre = req.getParameter("hor_cierre");
       try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
       } catch (ClassNotFoundException e) {
           throw new RuntimeException(e);
       }
       Database.connect();
       try {
           Club club = Database.jdbi.withExtension(ClubDAO.class, dao -> {
               dao.crearClub(nom_club.trim(),nom_calle.trim(),num_calle.trim(),cp.trim(),hor_apert.trim(),hor_cierre.trim());
               return null;
           });
           out.println("<div class='alert alert-dark' role='alert'>Club registrado correctamente</div>");
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
   }
}
