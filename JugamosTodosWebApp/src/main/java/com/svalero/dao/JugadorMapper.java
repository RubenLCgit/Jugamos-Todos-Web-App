package com.svalero.dao;

import com.svalero.models.Jugador;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.Date;
import java.time.LocalDate;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JugadorMapper implements RowMapper<Jugador> {
    @Override
    public Jugador map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Jugador(rs.getString("ID_JUGADOR"),rs.getString("APELLIDOS"),rs.getDate("FECHA_NAC").toLocalDate(),rs.getString("TELEFONO"),rs.getString("USERNAME"),rs.getString("PASSWORD"));
    }
}
