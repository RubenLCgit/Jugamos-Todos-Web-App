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
import java.util.Scanner;

@WebServlet("/eliminar-club")
public class DeleteClubServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String id = req.getParameter("id");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Database.connect();
        try {
            Club club = Database.jdbi.withExtension(ClubDAO.class, dao -> {
                dao.borrarClub(id.trim());
                return null;
            });
            resp.sendRedirect("get-clubs.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
