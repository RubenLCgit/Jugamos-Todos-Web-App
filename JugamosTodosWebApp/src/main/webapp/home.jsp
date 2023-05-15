<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.ClubDAO"%>
<%@ page import= "com.svalero.models.Club"%>
<%@ page import= "java.util.List"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("search-club", formValue, function(data) {
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
            $.post("search-juego", formValue, function(data) {
                $("#result2").html(data);
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
          <a href="get-games.jsp" class="btn btn-dark my-2">Mostrar Juegos</a>
          <a href="get-clubs.jsp" class="btn btn-dark my-2">Mostrar Clubs</a>
          <a href="register-club.jsp" class="btn btn-dark my-2">Registrar club</a>
          <a href="register-game.jsp" class="btn btn-dark my-2">Registrar juego</a>
          <button type="button" class="btn btn-outline-secondary">Página principal</button>
          <a href="index.jsp" class="btn btn-dark my-2">Salir</a>
        </p>
      </div>
    </div>
  </section>

  <img src="https://analisisalcubo.es/wp-content/uploads/2015/07/IMG_6393-1024x768.jpg" class="card-img-top" alt="Estanteria con juegos de mesa" style="width: 50%; display: block; margin-left: auto; margin-right: auto;">
  <br/><br/>

  <div class="container">
        <h3>BUSCAR CLUB</h3>
        <br/>
        <form class="row g-3" id="form1">
          <div class="col">
            <input type="text" class="form-control" id="nombreClub" name="nom_club" placeholder="Nombre del club">
          </div>
          <div class="col">
            <input type="text" class="form-control" id="inputCp" name="cp" placeholder="Código Postal">
          </div>
          <div class="col-auto">
            <button type="submit" class="btn btn-primary">Buscar</button>
          </div>
        </form>

        <br/>
        <div id="result"></div>
        <br/>

        <h3>BUSCAR JUEGO</h3>
        <br/>
        <form class="row g-3" id="form2">
            <div class="col">
                <input type="text" class="form-control" id="nombreJuego" name="nomJuego" placeholder="Nombre del juego">
            </div>
            <div class="col">
                <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Tipo de juego">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </div>
        </form>

        <br/>
        <div id="result2"></div>
  </div>

</main>

<%@include file="includes/footer.jsp"%>