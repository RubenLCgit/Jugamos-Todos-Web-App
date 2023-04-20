package com.svalero.dao;

import com.svalero.models.Club;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ClubMapper implements RowMapper<Club> {
    @Override
    public Club map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Club(rs.getString("ID_CLUB"),
                rs.getString("NOMBRE"),
                rs.getString("CALLE"),
                rs.getString("NUMERO"),
                rs.getString("CP"),
                rs.getString("HORARIO_APERT"),
                rs.getString("HORARIO_CIER"));
    }
}
