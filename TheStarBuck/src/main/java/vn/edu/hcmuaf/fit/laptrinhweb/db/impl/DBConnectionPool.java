package vn.edu.hcmuaf.fit.laptrinhweb.db.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.db.DBProperties;
import vn.edu.hcmuaf.fit.laptrinhweb.db.IDBConnectionPool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Queue;

public class DBConnectionPool implements IDBConnectionPool {
    private static final Queue<Connection> availableConnections = new LinkedList<>();
    private int maxConnection;

    public DBConnectionPool(int maxConnection) {
        this.maxConnection = maxConnection;
        initializeConnectionPool();
    }

    private synchronized void initializeConnectionPool() {
        try {
           while (!checkIfConnectionPoolsFull()){
                Connection newConnection = DBConnectionUtils.openConnection();
                availableConnections.add(newConnection);
           }
           notifyAll();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private boolean checkIfConnectionPoolsFull() {
        return availableConnections.size() >= maxConnection;
    }

    @Override
    public synchronized Connection getConnection() {
        while(availableConnections.size()==0){
            //waiting for an existing connection to be freed up
            try {
                wait();
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        //retrieves and removes the first element of this list
        return availableConnections.poll();
    }

    @Override
    public synchronized boolean releaseConnection(Connection connection) {
        try{
            if(connection.isClosed()){
                initializeConnectionPool();
            }else{
                //add the specified element as the last element of this list
                boolean isReleased = availableConnections.offer(connection);
                //wake up all threads that are waiting for a connection
                notifyAll();
                return isReleased;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    public synchronized String toString() {
        StringBuilder sb = new StringBuilder();
                sb.append("Max=" + DBProperties.getDbMaxConnections());
                sb.append(" | Available=" + availableConnections.size());
                sb.append(" | Busy=" + (DBProperties.getDbMaxConnections() - availableConnections.size()));
        return sb.toString();
    }
}
