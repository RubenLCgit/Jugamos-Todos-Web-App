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


@WebServlet("/enter-player")
public class EnterPlayerServlet extends HttpServlet {
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
       try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
       } catch (ClassNotFoundException e) {
           throw new RuntimeException(e);
       }
       Database.connect();
       Jugador jugador = Database.jdbi.withExtension(JugadorDAO.class, dao -> {
           return dao.getUserJugador(userName);
       });
       if (jugador!=null){
           if (jugador.getPassword().matches(password)){
               resp.sendRedirect("home.jsp");
           }else resp.sendRedirect("index.jsp");
       }else resp.sendRedirect("index.jsp");
   }
}
