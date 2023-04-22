package com.svalero.servlet;

import com.svalero.dao.ClubDAO;
import com.svalero.dao.Database;
import com.svalero.dao.JuegoDAO;
import com.svalero.models.Club;
import com.svalero.models.Juego;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search-juego")
public class SearchJuegoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String nomJuego = req.getParameter("nomJuego");
        String tipo = req.getParameter("tipo");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Database.connect();
            List<Juego> juegos = Database.jdbi.withExtension(JuegoDAO.class, dao -> dao.buscarJuegos(nomJuego,tipo));
            String html = "<html><head><title>Resultados</title></head><body><table style=\"border-collapse: separate; border-spacing: 10px;\"><tr><th>ID DEL JUEGO</th><th>NOMBRE</th><th>TIPO</th><th>DURACIÓN MÁXIMA</th><th>MÁXIMO DE JUGADORES</th></tr>";
            for (Juego juego: juegos
            ) {
                html += "<tr><td>" + juego.getId() + "</td><td>" + juego.getNomJuego() + "</td><td>" + juego.getTipo() + "</td><td>" + juego.getDuracion_max() + "</td><td>" + juego.getMax_jug() + "</td></tr>";
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
