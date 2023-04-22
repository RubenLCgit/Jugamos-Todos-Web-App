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

    @SqlQuery("SELECT * FROM CLUB WHERE ID_CLUB = ?")
    @UseRowMapper(ClubMapper.class)
    Club getClub(String id);

    @SqlUpdate("INSERT INTO CLUB(NOMBRE, CALLE, NUMERO, CP, HORARIO_APERT, HORARIO_CIER) VALUES (?, ?, ?, ?, ?, ?)")
    void crearClub (String nomClub, String nomCalle, String numCalle, String cp, String hor_apert, String hor_cier)throws SQLException;

    @SqlUpdate("DELETE FROM CLUB WHERE ID_CLUB= ?")
    void borrarClub (String id)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET HORARIO_APERT = ? WHERE NOMBRE = ?")
    void modificarClub (String horario_apert, String nombre)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET NOMBRE = ? WHERE ID_CLUB = ?")
    void modificarNomClub (String nom_club, String id)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET CALLE = ? WHERE ID_CLUB = ?")
    void modificarCalleClub (String nom_calle, String id)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET NUMERO = ? WHERE ID_CLUB = ?")
    void modificarNumClub (String num_calle, String id)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET CP = ? WHERE ID_CLUB = ?")
    void modificarCpClub (String cp, String id)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET HORARIO_APERT = ? WHERE ID_CLUB = ?")
    void modificarApertClub (String hor_apert, String id)throws SQLException;

    @SqlUpdate("UPDATE CLUB SET HORARIO_CIER = ? WHERE ID_CLUB = ?")
    void modificarCierClub (String hor_cierre, String id)throws SQLException;

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
