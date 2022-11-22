package vn.edu.hcmuaf.fit.laptrinhweb.db;

import java.sql.Connection;

public interface IDBConnectionPool {
    Connection getConnection();
    boolean releaseConnection(Connection connection);
}
