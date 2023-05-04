package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.JugadorDAO;
import com.svalero.models.Jugador;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;


@WebServlet("/add-player")
public class AddPlayerServlet extends HttpServlet {
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String nomJugador = req.getParameter("nomJugador");
        String apellidos = req.getParameter("apellidos");
        Date fecha_nac = Date.valueOf(req.getParameter("fecha_nac"));
        String telefono = req.getParameter("telefono");
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
       try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
       } catch (ClassNotFoundException e) {
           throw new RuntimeException(e);
       }
       Database.connect();
       try {
           Jugador jugador = Database.jdbi.withExtension(JugadorDAO.class, dao -> {
               return dao.getUserJugador(userName);
           });
           if (jugador==null){
               jugador = Database.jdbi.withExtension(JugadorDAO.class, dao -> {
               dao.crearJugador(nomJugador.trim(),apellidos.trim(),fecha_nac,telefono.trim(),userName.trim(),password.trim());
               return null;
               });
               out.println("<div class='alert alert-dark' role='alert'>Jugador registrado correctamente</div>");
           }else out.println("<div class='alert alert-dark' role='alert'>El usuario ya existe</div>");

       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
   }
}
