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
            $.post("add-player", formValue, function(data) {
                $("#result1").html(data);
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
          <button type="button" class="btn btn-dark my-2">INICIO SESIÓN / REGISTRO</button>
        </p>
      </div>
    </div>
  </section>

  <img src="https://analisisalcubo.es/wp-content/uploads/2015/07/IMG_6393-1024x768.jpg" class="card-img-top" alt="Estanteria con juegos de mesa" style="width: 50%; display: block; margin-left: auto; margin-right: auto;">
  <br/><br/>

    <div style="max-width: 100%; margin: 2%; display: flex; justify-content: center; align-items: center; text-align: center">
        <form action="enter-player" method="post" id="form2" style="margin: 5%; padding: 1%; border: solid black 5px; border-radius: 30px; background-color: grey; min-width: 40%">
            <div class="mb-3">
                <label for="InputUserName" class="form-label">Nombre de Usuario</label>
                <input type="text" class="form-control" id="InputUserName" name="userName" required>
            </div>
            <div class="mb-3">
                <label for="InputPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="InputPassword" name="password" required>
            </div>
            <button type="submit" class="btn btn-dark my-2">Entrar</button>
        </form>
        <br/><br/>
        <div id="result2"></div>
        <br/><br/>
    </div>

    <div style="max-width: 100%; margin: 2%; display: flex; justify-content: center; align-items: center; text-align: center">
        <form id="form1" style="margin: 5%; padding: 1%; border: solid black 5px; border-radius: 30px; background-color: grey; min-width: 40%">
            <div class="mb-3">
                <label for="registerFirstName" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="registerFirstName" name="nomJugador" required>
            </div>
            <div class="mb-3">
                <label for="registerLastNames" class="form-label">Apellidos</label>
                <input type="text" class="form-control" id="registerLastNames" name="apellidos" required>
            </div>
            <div class="mb-3">
                <label for="registerPhoneNumber" class="form-label">Teléfono</label>
                <input type="text" class="form-control" id="registerPhoneNumber" name="telefono" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Fecha de nacimiento</label>
                <input type="date" id="date" name="fecha_nac" value="01-01-2020" min="01-01-1950" max="01-01-2023">
            </div>
            <div class="mb-3">
                <label for="registerUserName" class="form-label">Nombre de Usuario</label>
                <input type="text" class="form-control" id="registerUserName" name="userName" required>
            </div>
            <div class="mb-3">
                <label for="registerPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="registerPassword" name="password" required>
            </div>
            <button type="submit" class="btn btn-dark my-2">Registrarse</button>
        </form>
        <div id="result1"></div>
        <br/><br/>
    </div>

</main>

<%@include file="includes/footer.jsp"%>