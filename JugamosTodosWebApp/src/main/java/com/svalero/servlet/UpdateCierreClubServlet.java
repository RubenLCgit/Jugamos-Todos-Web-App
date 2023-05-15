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

@WebServlet("/update-cierreClub")
public class UpdateCierreClubServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String hor_cierre = req.getParameter("hor_cierre");
        String id = req.getParameter("id");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Database.connect();
        try {
            Database.jdbi.withExtension(ClubDAO.class, dao -> {
                dao.modificarCierClub(hor_cierre.trim(), id.trim());
                return null;
            });
            out.println("<div class='alert alert-dark' role='alert'>Nombre modificado correctamente</div>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
