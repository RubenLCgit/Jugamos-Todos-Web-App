<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.JuegoDAO"%>
<%@ page import= "com.svalero.models.Juego"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<main>

<section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Aplicación para gestión de Juegos y Eventos</h1>
        <p>
          <a href="index.jsp" class="btn btn-dark my-2">Página principal</a>
          <a href="get-games.jsp" class="btn btn-dark my-2">Mostrar Juegos</a>
          <a href="get-clubs.jsp" class="btn btn-dark my-2">Mostrar Clubs</a>
          <a href="register-club.jsp" class="btn btn-dark my-2">Registrar club</a>
          <a href="register-game.jsp" class="btn btn-dark my-2">Registrar juego</a>
          <button type="button" class="btn btn-outline-secondary">Detalles del juego</button>
        </p>
      </div>
    </div>
  </section>

<%
    String juegoId = request.getParameter("id");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Database.connect();
    Juego juego = Database.jdbi.withExtension(JuegoDAO.class, dao -> dao.getJuego(juegoId));
%>
<div class="container">
    <div class="card mb-3">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h1>NOMBRE DEL JUEGO: <span class="badge bg-secondary"><%= juego.getNomJuego() %></span></h1>
        <ul class="list-group">
          <li class="list-group-item list-group-item-dark">ID ASIGNADO EN LA BASE DE DATOS: <%= juego.getId() %></li>
          <li class="list-group-item list-group-item-dark">TIPO DE JUEGO: <%= juego.getTipo() %></li>
          <li class="list-group-item list-group-item-dark">MÁXIMO DE JUGADORES: <%= juego.getMax_jug() %></li>
          <li class="list-group-item list-group-item-dark">DURACIÓN MÁXIMA: <%= juego.getDuracion_max() %></li>
        </ul>
      </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>