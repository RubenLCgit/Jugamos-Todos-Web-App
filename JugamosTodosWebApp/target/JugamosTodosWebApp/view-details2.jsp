<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.JuegoDAO"%>
<%@ page import= "com.svalero.models.Juego"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("update-nomJuego", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form2").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("update-tipoJuego", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form3").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("update-duracionJuego", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form4").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("update-maxJugadoresJuego", formValue, function(data) {
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
          <a href="register-game.jsp" class="btn btn-dark my-2">Registrar juego</a>
          <button type="button" class="btn btn-outline-secondary">Detalles del juego</button>
          <a href="index.jsp" class="btn btn-dark my-2">Salir</a>
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

        <form class="row g-3" id="form1">
            <div class="col-auto">
                <h3>NOMBRE DEL JUEGO:<span class="badge bg-secondary"><%= juego.getNomJuego() %></span></h3>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" id="updateNomJuego" name="nomJuego" required placeholder="Nuevo nombre">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= juego.getId() %>">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form2">
            <div class="col-auto">
              <h3>TIPO DE JUEGO: <span class="badge bg-secondary"><%= juego.getTipo() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateTipoJuego" name="tipo" required placeholder="Nueva tipo">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= juego.getId() %>">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form3">
            <div class="col-auto">
              <h3>DURACIÓN MAXIMA DEL JUEGO: <span class="badge bg-secondary"><%= juego.getDuracion_max() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateDuracion" name="duracion_max" required placeholder="Nueva duración">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= juego.getId() %>">
            </div>
            <div class="col-auto">
              <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form4">
            <div class="col-auto">
              <h3>MÁXIMO NÚMERO DE JUGADORES: <span class="badge bg-secondary"><%= juego.getMax_jug() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateMaxJug" name="max_jug" required placeholder="Nueva Duración">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= juego.getId() %>">
            </div>
            <div class="col-auto">
              <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>
        <br/>
        <div id="result"></div>
      </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>