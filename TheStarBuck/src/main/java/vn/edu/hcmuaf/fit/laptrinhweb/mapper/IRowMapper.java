package vn.edu.hcmuaf.fit.laptrinhweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface IRowMapper<T> {
    T mapRow(ResultSet resultSet) throws SQLException;
}
