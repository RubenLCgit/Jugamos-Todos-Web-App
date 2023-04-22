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
import java.util.List;

@WebServlet("/search-club")
public class SearchClubServlet extends HttpServlet {
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String nom_club = req.getParameter("nom_club");
        String cp = req.getParameter("cp");
       try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
           Database.connect();
           List<Club> clubs = Database.jdbi.withExtension(ClubDAO.class, dao -> dao.buscarClub(nom_club,cp));
           String html = "<html><head><title>Resultados</title></head><body><table style=\"border-collapse: separate; border-spacing: 10px;\"><tr><th>ID DEL CLUB</th><th>NOMBRE DEL CLUB</th><th>CALLE</th><th>NÚMERO</th><th>CÓDIGO POSTAL</th><th>HORA DE APERTURA</th><th>HORA DE CIERRE</th></tr>";
           for (Club club: clubs
                ) {
               html += "<tr><td>" + club.getId() + "</td><td>" + club.getNom_club() + "</td><td>" + club.getNom_calle() + "</td><td>" + club.getNum_calle() + "</td><td>" + club.getCp() + "</td><td>" + club.getHor_apert() + "</td><td>" + club.getHor_cierre() + "</td></tr>";
           }
           html += "</table></body></html>";
           out.println(html);
           out.close();
       } catch (ClassNotFoundException cnfe) {
           cnfe.printStackTrace();
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
   }
}
