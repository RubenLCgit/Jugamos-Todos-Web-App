<%@ page import= "com.svalero.dao.Database"%>
<%@ page import= "com.svalero.dao.JuegoDAO"%>
<%@ page import= "com.svalero.models.Juego"%>
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
          <a href="get-clubs.jsp" class="btn btn-dark my-2">Mostrar Clubs</a>
          <a href="register-club.jsp" class="btn btn-dark my-2">Registrar club</a>
          <a href="register-game.jsp" class="btn btn-dark my-2">Registrar juego</a>
          <button type="button" class="btn btn-outline-secondary">Mostrar Juegos</button>
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Database.connect();
            List<Juego> juegos = Database.jdbi.withExtension(JuegoDAO.class, JuegoDAO::getJuegos);
            for (Juego juego : juegos){
        %>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            <div class="card-body">
              <p class="card-text"> NOMBRE : <%= juego.getNomJuego()%>   ||  TIPO : <%= juego.getTipo()%></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="view-details2.jsp?id=<%= juego.getId() %>" class="btn btn-primary">Ver detalles del juego</a>
                  <a href="eliminar-juego?id=<%= juego.getId() %>" class="btn btn-danger">Eliminar juego</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <%
            }
        %>
      </div>
    </div>
  </div>

</main>

<%@include file="includes/footer.jsp"%>