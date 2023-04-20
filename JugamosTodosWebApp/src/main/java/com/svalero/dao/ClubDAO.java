package com.svalero.dao;

import com.svalero.models.Club;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.SQLException;
import java.util.List;

public interface ClubDAO {
    @SqlQuery("SELECT * FROM CLUB")
    @UseRowMapper(ClubMapper.class)
    List<Club> getClubs()throws SQLException;

    @SqlUpdate("INSERT INTO CLUB(NOMBRE, CALLE, NUMERO, CP, HORARIO_APERT, HORARIO_CIER) VALUES (?, ?, ?, ?, ?, ?)")
    void crearClub (String nomClub, String nomCalle, String numCalle, String cp, String hor_apert, String hor_cier)throws SQLException;

    @SqlUpdate("DELETE FROM CLUB WHERE NOMBRE= ?")
    void borrarClub (String nomClub)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET HORARIO_APERT = ? WHERE NOMBRE = ?")
    void modificarClub (String horario_apert, String nombre)throws SQLException;

    @SqlQuery("SELECT * FROM CLUB WHERE NOMBRE= ? OR CP= ?")// TODO -- CON ANOTACIONES SI NO INTRODUZCO LOS DOS VALORES, NO ME MUESTRA NADA
    @UseRowMapper(ClubMapper.class)
    List<Club> buscarClub(String nomClub, String cp)throws SQLException;

    @SqlQuery("SELECT * FROM CLUB WHERE NOMBRE= ?")
    @UseRowMapper(ClubMapper.class)
    List<Club> buscarNomClub(String nomClub)throws SQLException;

    @SqlQuery("SELECT * FROM CLUB WHERE CP= ?")
    @UseRowMapper(ClubMapper.class)
    List<Club> buscarCpClub(String cp)throws SQLException;

    @SqlQuery("SELECT COUNT(*) FROM CLUB WHERE NOMBRE= ?")
    int existeNomClub (String nomClub)throws SQLException;

    @SqlQuery("SELECT COUNT(*) FROM CLUB WHERE CP= ?")
    int existeCpClub (String cp)throws SQLException;
}
