<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.ClubDAO"%>
<%@ page import= "com.svalero.models.Club"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("update-nomClub", formValue, function(data) {
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
            $.post("update-calleClub", formValue, function(data) {
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
            $.post("update-numCalle", formValue, function(data) {
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
            $.post("update-CpClub", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form5").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("update-aperturaClub", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form6").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("update-cierreClub", formValue, function(data) {
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
          <button type="button" class="btn btn-outline-secondary">Detalles del club</button>
          <a href="index.jsp" class="btn btn-dark my-2">Salir</a>
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
      <div class="card-body">

        <form class="row g-3" id="form1">
            <div class="col-auto">
                <h3>NOMBRE DEL CLUB:<span class="badge bg-secondary"><%= club.getNom_club() %></span>  <span class="badge bg-secondary">ID : <%= club.getId() %></span></h3>
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" id="updateNomClub" name="nom_club" required placeholder="Nuevo nombre">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= club.getId() %>">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form2">
            <div class="col-auto">
              <h3>NOMBRE DE LA CALLE / AVENIDA: <span class="badge bg-secondary"><%= club.getNom_calle() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateNomCalle" name="nom_calle" required placeholder="Nueva calle">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= club.getId() %>">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form3">
            <div class="col-auto">
              <h3>NÚMERO DE PISO / BLOQUE / LOCAL: <span class="badge bg-secondary"><%= club.getNum_calle() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateNumCalle" name="num_calle" required placeholder="Nuevo número de calle">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= club.getId() %>">
            </div>
            <div class="col-auto">
              <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form4">
            <div class="col-auto">
              <h3>CÓDIGO POSTAL: <span class="badge bg-secondary"><%= club.getCp() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateCp" name="cp" required placeholder="Nuevo código postal">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= club.getId() %>">
            </div>
            <div class="col-auto">
              <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form5">
            <div class="col-auto">
              <h3>HORARIO DE APERTURA: <span class="badge bg-secondary"><%= club.getHor_apert() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateHorApert" name="hor_apert" required placeholder="Nuevo horario de apertura">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= club.getId() %>">
            </div>
            <div class="col-auto">
              <button type="submit" class="btn btn-primary mb-3">Modificar</button>
            </div>
        </form>

        <form class="row g-3" id="form6">
            <div class="col-auto">
              <h3>HORARIO DE CIERRE: <span class="badge bg-secondary"><%= club.getHor_cierre() %></span></h3>
            </div>
            <div class="col-auto">
              <input type="text" class="form-control" id="updateHorCier" name="hor_cierre" required placeholder="Nuevo horario de cierre">
            </div>
            <div class="col-auto">
                <input type="hidden" class="form-control" name="id" value="<%= club.getId() %>">
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