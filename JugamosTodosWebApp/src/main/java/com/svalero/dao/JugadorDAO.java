package com.svalero.dao;

import com.svalero.models.Jugador;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public interface JugadorDAO {
    @SqlQuery("SELECT * FROM JUGADOR")
    @UseRowMapper(JugadorMapper.class)
    List<Jugador> getClubs()throws SQLException;

    @SqlQuery("SELECT * FROM JUGADOR WHERE ID_JUGADOR = ?")
    @UseRowMapper(JugadorMapper.class)
    Jugador getJugador(String id);

    @SqlQuery("SELECT * FROM JUGADOR WHERE USERNAME = ?")
    @UseRowMapper(JugadorMapper.class)
    Jugador getUserJugador(String username);

    @SqlQuery("SELECT * FROM JUGADOR WHERE PASSWORD = ?")
    @UseRowMapper(JugadorMapper.class)
    Jugador getPasswordJugador(String password);

    @SqlUpdate("INSERT INTO JUGADOR(NOMBRE, APELLIDOS, FECHA_NAC, TELEFONO, USERNAME, PASSWORD) VALUES (?, ?, ?, ?, ?, ?)")
    void crearJugador (String nomJugador, String apellidos, Date fecha_nac, String telefono, String userName, String password)throws SQLException;

    @SqlUpdate("DELETE FROM JUGADOR WHERE ID_JUGADOR= ?")
    void borrarJugador (String id)throws SQLException;

    @SqlUpdate("UPDATE JUGADOR SET NOMBRE = ? WHERE ID_JUGADOR = ?")
    void modificarJugador (String nomJugador, String id)throws SQLException;

    @SqlUpdate("UPDATE JUGADOR SET APELLIDOS = ? WHERE ID_JUGADOR = ?")
    void modificarNomJugador (String apellidos, String id)throws SQLException;

    @SqlUpdate("UPDATE JUGADOR SET FECHA_NAC = ? WHERE ID_JUGADOR = ?")
    void modificarApellidos (String fecha_nac, String id)throws SQLException;

    @SqlUpdate("UPDATE JUGADOR SET TELEFONO = ? WHERE ID_JUGADOR = ?")
    void modificarTelefono (String telefono, String id)throws SQLException;

    @SqlUpdate("UPDATE JUGADOR SET USERNAME = ? WHERE ID_JUGADOR = ?")
    void modificarUserName (String userName, String id)throws SQLException;

    @SqlUpdate("UPDATE JUGADOR SET PASSWORD = ? WHERE ID_JUGADOR = ?")
    void modificarPasswrod (String password, String id)throws SQLException;

    @SqlQuery("SELECT * FROM JUGADOR WHERE NOMBRE= ? OR USERNAME= ?")
    @UseRowMapper(JugadorMapper.class)
    List<Jugador> buscarJugador(String nomJugador, String username)throws SQLException;

    @SqlQuery("SELECT * FROM JUGADOR WHERE NOMBRE= ?")
    @UseRowMapper(ClubMapper.class)
    List<Jugador> buscarNomJugador(String nomJugador)throws SQLException;

    @SqlQuery("SELECT * FROM JUGADOR WHERE APELLIDOS= ?")
    @UseRowMapper(JugadorMapper.class)
    List<Jugador> buscarApellidosJugador(String apellidos)throws SQLException;

    @SqlQuery("SELECT * FROM JUGADOR WHERE USERNAME= ?")
    String PasswordJugador (String userName)throws SQLException;

    @SqlQuery("SELECT COUNT(*) FROM JUGADOR WHERE USERNAME= ?")
    int existeUsernameJugador (String userName)throws SQLException;
}
