package vn.edu.hcmuaf.fit.laptrinhweb.db.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.db.DBProperties;
import vn.edu.hcmuaf.fit.laptrinhweb.db.IDBConnectionPool;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
    private static DBConnection dbConnection;
    private static final IDBConnectionPool dbPool = new DBConnectionPool(DBProperties.getDbMaxConnections());
    private DBConnection() {
    }

    public static DBConnection getInstance() {
        try {
            if (dbConnection == null || getConnection().isClosed()) {
                dbConnection = new DBConnection();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dbConnection;
    }

    public static Connection getConnection() {
        Connection connection=dbPool.getConnection();
        System.out.println("Pool status: " + dbPool);
        return connection;
    }

    public static boolean releaseConnection(Connection connection) {
        boolean check = dbPool.releaseConnection(connection);
        System.out.println("Pool status: " + dbPool);
        return check;
    }

}
