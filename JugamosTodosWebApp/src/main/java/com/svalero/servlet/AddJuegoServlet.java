package com.svalero.servlet;

import com.svalero.dao.JuegoDAO;
import com.svalero.dao.Database;
import com.svalero.models.Juego;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/add-game")
public class AddJuegoServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String nomJuego = req.getParameter("nomJuego");
        int max_jug = Integer.parseInt(req.getParameter("max_jug"));
        String tipo = req.getParameter("tipo");
        int duracion_max = Integer.parseInt(req.getParameter("duracion_max"));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Database.connect();
        try {
            Juego juego = Database.jdbi.withExtension(JuegoDAO.class, dao -> {
                dao.crearJuego(nomJuego.trim(),max_jug,duracion_max,tipo.trim());
                return null;
            });
            out.println("<div class='alert alert-dark' role='alert'>Juego registrado correctamente</div>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
