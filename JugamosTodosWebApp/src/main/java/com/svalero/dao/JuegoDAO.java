package com.svalero.dao;

import com.svalero.models.Club;
import com.svalero.models.Juego;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.SQLException;
import java.util.List;

public interface JuegoDAO {
    @SqlQuery("SELECT * FROM JUEGOS")
    @UseRowMapper(JuegoMapper.class)
    List<Juego> getJuegos()throws SQLException;

    @SqlQuery("SELECT * FROM JUEGOS WHERE ID_JUEGO = ?")
    @UseRowMapper(JuegoMapper.class)
    Juego getJuego(String id);

    @SqlUpdate("INSERT INTO JUEGOS(NOMBRE, MAX_JUGADORES, DURACION_MIN, TIPO) VALUES (?, ?, ?, ?)")
    void crearJuego (String nombre, int max_jug, int duracion_max, String tipo)throws SQLException;;

    @SqlUpdate("DELETE FROM JUEGOS WHERE NOMBRE= ?")
    void borrarJuego (String nombre)throws SQLException;;

    @SqlUpdate("UPDATE JUEGOS SET NOMBRE = ? WHERE ID_JUEGO = ?")
    void modificarNomJuego (String nombre,String id)throws SQLException;

    @SqlUpdate("UPDATE JUEGOS SET TIPO = ? WHERE ID_JUEGO = ?")
    void modificarTipoJuego (String tipo,String id)throws SQLException;

    @SqlUpdate("UPDATE JUEGOS SET DURACION_MIN = ? WHERE ID_JUEGO = ?")
    void modificarDuracionJuego (String duracion_max,String id)throws SQLException;

    @SqlUpdate("UPDATE JUEGOS SET MAX_JUGADORES = ? WHERE ID_JUEGO = ?")
    void modificarJugadoresJuego (String max_jug, String id)throws SQLException;

    @SqlQuery("SELECT * FROM JUEGOS WHERE NOMBRE= ? OR TIPO= ?")// TODO -- CON ANOTACIONES SI NO INTRODUZCO LOS DOS VALORES, NO ME MUESTRA NADA
    @UseRowMapper(JuegoMapper.class)
    List<Juego> buscarJuegos(String nomJue, String tipo)throws SQLException;;

    @SqlQuery("SELECT * FROM JUEGOS WHERE NOMBRE= ?")//
    @UseRowMapper(JuegoMapper.class)
    List<Juego> buscarNomJuegos(String nomJue)throws SQLException;

    @SqlQuery("SELECT * FROM JUEGOS WHERE TIPO= ?")//
    @UseRowMapper(JuegoMapper.class)
    List<Juego> buscarTipJuegos(String tipo)throws SQLException;

    @SqlQuery("SELECT COUNT(*) FROM JUEGOS WHERE NOMBRE= ?")
    int existeNomJuego (String nomJue);

    @SqlQuery("SELECT COUNT(*) FROM JUEGOS WHERE TIPO= ?")
    int existeTipJuego (String tipo);
}
