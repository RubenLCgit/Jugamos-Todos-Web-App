<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.ClubDAO"%>
<%@ page import= "com.svalero.models.Club"%>
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
          <button type="button" class="btn btn-outline-secondary">Editar club</button>
        </p>
      </div>
    </div>
  </section>

<%
    String clubId = request.getParameter("id");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Database.connect();
    Club club = Database.jdbi.withExtension(ClubDAO.class, dao -> dao.getClub(clubId));
%>
<div class="container">
    <div class="card mb-3">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h1>NOMBRE DEL CLUB: <span class="badge bg-secondary"><%= club.getNom_club() %></span></h1>
        <ul class="list-group">
          <li class="list-group-item list-group-item-dark">ID ASIGNADO EN LA BASE DE DATOS: <%= club.getId() %></li>
          <li class="list-group-item list-group-item-dark">NOMBRE DE LA CALLE / AVENIDA: <%= club.getNom_calle() %></li>
          <li class="list-group-item list-group-item-dark">NÚMERO DE PISO / BLOQUE / LOCAL: <%= club.getNum_calle() %></li>
          <li class="list-group-item list-group-item-dark">CÓDIGO POSTAL: <%= club.getCp() %></li>
          <li class="list-group-item list-group-item-dark">HORARIO DE APERTURA: <%= club.getHor_apert() %></li>
          <li class="list-group-item list-group-item-dark">HORARIO DE CIERRE: <%= club.getHor_cierre() %></li>
        </ul>
      </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>