<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.JuegoDAO"%>
<%@ page import= "com.svalero.models.Juego"%>
<%@ page import= "java.util.List"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("add-game", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<main>

<section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Aplicación para gestión de Juegos y Eventos</h1>
        <p>
          <a href="home.jsp" class="btn btn-dark my-2">Página principal</a>
          <a href="get-games.jsp" class="btn btn-dark my-2">Mostrar Juegos</a>
          <a href="get-clubs.jsp" class="btn btn-dark my-2">Mostrar Clubs</a>
          <a href="register-club.jsp" class="btn btn-dark my-2">Registrar club</a>
          <button type="button" class="btn btn-outline-secondary">Registrar juego</button>
          <a href="index.jsp" class="btn btn-dark my-2">Salir</a>
        </p>
      </div>
    </div>
</section>

<div class="container">

      <form class="row g-3">
        <div class="col-md-6">
          <label for="nombreJuego" class="form-label">Nombre del juego</label>
          <input type="text" class="form-control" id="nombreJuego" name="nomJuego" placeholder="Introducir aquí nombre del juego">
        </div>
        <div class="col-md-2">
          <label for="max_jug" class="form-label">Máximo de jugadores</label>
          <input type="text" class="form-control" id="max_jug" name="max_jug" placeholder="Introduce un número. Ejemplo: 4">
        </div>
        <div class="col-md-2">
            <label for="tipo" class="form-label">Tipo de juego</label>
            <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Ejemplo: Eurogame">
        </div>
        <div class="col-md-2">
            <label for="duracion_max" class="form-label">Duración máxima</label>
            <input type="text" class="form-control" id="duracion_max" name="duracion_max" placeholder="Duración en minutos">
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-primary">Registrar</button>
        </div>
      </form>
      <br/>
      <div id="result"></div>
  </div>

</main>

<%@include file="includes/footer.jsp"%>