<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.ClubDAO"%>
<%@ page import= "com.svalero.models.Club"%>
<%@ page import= "java.util.List"%>
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
          <a href="add-game.jsp" class="btn btn-dark my-2">Registrar juego</a>
          <button type="button" class="btn btn-outline-secondary">Registrar club</button>
        </p>
      </div>
    </div>
  </section>

  <div class="container">

      <form class="row g-3">
        <div class="col-md-6">
          <label for="formGroupExampleInput" class="form-label">Nombre del Club</label>
          <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Introducir aquí nombre del juego">
        </div>
        <div class="col-md-6">
          <label for="inputAddress" class="form-label">Dirección</label>
          <input type="text" class="form-control" id="inputAddress" placeholder="Nombre">
        </div>
        <div class="col-md-6">
          <label for="inputAddress2" class="form-label">Dirección 2</label>
          <input type="text" class="form-control" id="inputAddress2" placeholder="Bloque, Número, Planta">
        </div>
        <div class="col-md-2">
          <label for="inputZip" class="form-label">Código Postal</label>
          <input type="text" class="form-control" id="inputZip">
        </div>
        <div class="col-md-2">
            <label for="formGroupExampleInput" class="form-label">Horario de apertura</label>
            <input type="text" class="form-control" id="formGroupExampleInput" placeholder="HH:MM. Ejemplo: 17:30">
        </div>
        <div class="col-md-2">
            <label for="formGroupExampleInput" class="form-label">Horario de cierre</label>
            <input type="text" class="form-control" id="formGroupExampleInput" placeholder="HH:MM. Ejemplo: 00:15">
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-primary">Registrar</button>
        </div>
      </form>
  </div>

</main>

<%@include file="includes/footer.jsp"%>